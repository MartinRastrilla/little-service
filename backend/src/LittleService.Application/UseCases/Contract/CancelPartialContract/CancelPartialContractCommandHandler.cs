using LittleService.Application.Common;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Contract.CancelPartialContract;

public class CancelPartialContractCommandHandler
    : IRequestHandler<CancelPartialContractCommand, Result<CancelPartialContractResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<CancelPartialContractCommandHandler> _logger;

    public CancelPartialContractCommandHandler(
        IUnitOfWork unitOfWork,
        ILogger<CancelPartialContractCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<CancelPartialContractResult>> Handle(
        CancelPartialContractCommand command,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<CancelPartialContractResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            command.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<CancelPartialContractResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        var isClientOwner = user.Client != null && serviceRequest.ClientId == user.Client.Id;
        var isAssignedFreelancer = serviceRequest.FreelancerPickedId.HasValue &&
                                   serviceRequest.FreelancerPickedId.Value == user.Id;

        if (!isClientOwner && !isAssignedFreelancer)
            return Result<CancelPartialContractResult>.Failure(
                "No tienes permisos para anular este contrato",
                "FORBIDDEN");

        if (serviceRequest.Contract == null)
            return Result<CancelPartialContractResult>.Failure(
                "Este pedido aún no tiene un contrato",
                "CONTRACT_NOT_FOUND");

        var isPartiallySigned = serviceRequest.Contract.Status is ContractStatus.SignedByClient
            or ContractStatus.SignedByFreelancer;
        if (!isPartiallySigned)
            return Result<CancelPartialContractResult>.Failure(
                "Solo se puede anular un contrato con firma parcial",
                "CONTRACT_NOT_PARTIALLY_SIGNED");

        var contractId = serviceRequest.Contract.Id;

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.Contracts.DeleteAsync(contractId, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(
                ex,
                "Error al anular el contrato del pedido {ServiceRequestId}",
                command.ServiceRequestId);
            return Result<CancelPartialContractResult>.Failure(
                "Error al anular el contrato",
                "CANCEL_CONTRACT_ERROR");
        }

        _logger.LogInformation(
            "Contrato {ContractId} anulado (firma parcial) del pedido {ServiceRequestId}",
            contractId,
            command.ServiceRequestId);

        return Result<CancelPartialContractResult>.Success(new CancelPartialContractResult());
    }
}
