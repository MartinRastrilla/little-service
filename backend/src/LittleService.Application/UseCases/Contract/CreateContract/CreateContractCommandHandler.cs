using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Contract.CreateContract;

public class CreateContractCommandHandler
    : IRequestHandler<CreateContractCommand, Result<CreateContractResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<CreateContractCommandHandler> _logger;

    public CreateContractCommandHandler(
        IUnitOfWork unitOfWork,
        ILogger<CreateContractCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<CreateContractResult>> Handle(
        CreateContractCommand command,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<CreateContractResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<CreateContractResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            command.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<CreateContractResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<CreateContractResult>.Failure(
                "No tienes permisos para crear un contrato en esta solicitud",
                "FORBIDDEN");

        if (!serviceRequest.FreelancerPickedId.HasValue)
            return Result<CreateContractResult>.Failure(
                "Este pedido no tiene un profesional asignado.",
                "NO_ASSIGNED_PROFESSIONAL");

        var alreadyExists = await _unitOfWork.Contracts.ExistsByServiceRequestIdAsync(
            command.ServiceRequestId,
            cancellationToken);
        if (alreadyExists)
            return Result<CreateContractResult>.Failure(
                "Este pedido ya tiene un contrato",
                "CONTRACT_ALREADY_EXISTS");

        LittleService.Domain.Entities.Contract contract;
        try
        {
            contract = LittleService.Domain.Entities.Contract.Create(
                command.ServiceRequestId,
                command.Request.Terms,
                command.Request.StartDate,
                command.Request.EndDate,
                command.Request.Amount);
        }
        catch (DomainException ex)
        {
            return Result<CreateContractResult>.Failure(ex.Message, ex.ErrorCode);
        }

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.Contracts.AddAsync(contract, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(
                ex,
                "Error al crear el contrato para el pedido {ServiceRequestId}",
                command.ServiceRequestId);
            return Result<CreateContractResult>.Failure(
                "Error al crear el contrato",
                "CREATE_CONTRACT_ERROR");
        }

        _logger.LogInformation(
            "Contrato {ContractId} creado para el pedido {ServiceRequestId}",
            contract.Id,
            command.ServiceRequestId);

        return Result<CreateContractResult>.Success(new CreateContractResult
        {
            Contract = ContractMapper.Map(
                contract,
                serviceRequest.Price,
                isClientOwner: true,
                isAssignedFreelancer: false)
        });
    }
}
