using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Contract.SignContract;

public class SignContractCommandHandler
    : IRequestHandler<SignContractCommand, Result<SignContractResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<SignContractCommandHandler> _logger;

    public SignContractCommandHandler(
        IUnitOfWork unitOfWork,
        ILogger<SignContractCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<SignContractResult>> Handle(
        SignContractCommand command,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<SignContractResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            command.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<SignContractResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        var isClientOwner = user.Client != null && serviceRequest.ClientId == user.Client.Id;
        var isAssignedFreelancer = serviceRequest.FreelancerPickedId.HasValue &&
                                   serviceRequest.FreelancerPickedId.Value == user.Id;

        if (!isClientOwner && !isAssignedFreelancer)
            return Result<SignContractResult>.Failure(
                "No tienes permisos para firmar este contrato",
                "FORBIDDEN");

        if (serviceRequest.Contract == null)
            return Result<SignContractResult>.Failure(
                "Este pedido aún no tiene un contrato",
                "CONTRACT_NOT_FOUND");

        try
        {
            if (isClientOwner)
                serviceRequest.Contract.SignByClient();
            else
                serviceRequest.Contract.SignByFreelancer();
        }
        catch (DomainException ex)
        {
            return Result<SignContractResult>.Failure(ex.Message, ex.ErrorCode);
        }

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.Contracts.UpdateAsync(serviceRequest.Contract, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(
                ex,
                "Error al firmar el contrato del pedido {ServiceRequestId}",
                command.ServiceRequestId);
            return Result<SignContractResult>.Failure(
                "Error al firmar el contrato",
                "SIGN_CONTRACT_ERROR");
        }

        _logger.LogInformation(
            "Contrato {ContractId} firmado por el usuario {UserId}",
            serviceRequest.Contract.Id,
            command.UserId);

        return Result<SignContractResult>.Success(new SignContractResult
        {
            Contract = ContractMapper.Map(
                serviceRequest.Contract,
                serviceRequest.Price,
                isClientOwner,
                isAssignedFreelancer)
        });
    }
}
