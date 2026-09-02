using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Contract.UpdateContract;

public class UpdateContractCommandHandler
    : IRequestHandler<UpdateContractCommand, Result<UpdateContractResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<UpdateContractCommandHandler> _logger;

    public UpdateContractCommandHandler(
        IUnitOfWork unitOfWork,
        ILogger<UpdateContractCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<UpdateContractResult>> Handle(
        UpdateContractCommand command,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<UpdateContractResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<UpdateContractResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            command.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<UpdateContractResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<UpdateContractResult>.Failure(
                "No tienes permisos para editar este contrato",
                "FORBIDDEN");

        if (serviceRequest.Contract == null)
            return Result<UpdateContractResult>.Failure(
                "Este pedido aún no tiene un contrato",
                "CONTRACT_NOT_FOUND");

        try
        {
            serviceRequest.Contract.UpdateDetails(
                command.Request.Terms,
                command.Request.StartDate,
                command.Request.EndDate,
                command.Request.Amount);
        }
        catch (DomainException ex)
        {
            return Result<UpdateContractResult>.Failure(ex.Message, ex.ErrorCode);
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
                "Error al actualizar el contrato del pedido {ServiceRequestId}",
                command.ServiceRequestId);
            return Result<UpdateContractResult>.Failure(
                "Error al actualizar el contrato",
                "UPDATE_CONTRACT_ERROR");
        }

        _logger.LogInformation(
            "Contrato {ContractId} actualizado para el pedido {ServiceRequestId}",
            serviceRequest.Contract.Id,
            command.ServiceRequestId);

        return Result<UpdateContractResult>.Success(new UpdateContractResult
        {
            Contract = ContractMapper.Map(
                serviceRequest.Contract,
                serviceRequest.Price,
                canEdit: serviceRequest.Contract.IsDraft())
        });
    }
}
