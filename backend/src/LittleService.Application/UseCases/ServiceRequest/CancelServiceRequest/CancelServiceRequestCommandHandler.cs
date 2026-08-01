using LittleService.Application.Common;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.CancelServiceRequest;

public class CancelServiceRequestCommandHandler : IRequestHandler<CancelServiceRequestCommand, Result<CancelServiceRequestResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<CancelServiceRequestCommandHandler> _logger;

    public CancelServiceRequestCommandHandler(IUnitOfWork unitOfWork, ILogger<CancelServiceRequestCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<CancelServiceRequestResult>> Handle(CancelServiceRequestCommand command, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<CancelServiceRequestResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<CancelServiceRequestResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            command.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<CancelServiceRequestResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<CancelServiceRequestResult>.Failure("No tienes permisos para cancelar esta solicitud", "FORBIDDEN");

        try
        {
            serviceRequest.Cancel(serviceRequest.Contract, serviceRequest.FreelancerApplications);
        }
        catch (DomainException ex)
        {
            return Result<CancelServiceRequestResult>.Failure(ex.Message, ex.ErrorCode);
        }

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.ServiceRequests.UpdateAsync(serviceRequest, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al cancelar la solicitud de servicio {Id}", command.ServiceRequestId);
            return Result<CancelServiceRequestResult>.Failure("Error al cancelar la solicitud de servicio", "CANCEL_SERVICE_REQUEST_ERROR");
        }

        _logger.LogInformation("ServiceRequest {Id} cancelado por cliente {ClientId}", command.ServiceRequestId, user.Client.Id);
        return Result<CancelServiceRequestResult>.Success(new CancelServiceRequestResult
        {
            ServiceRequestId = serviceRequest.Id,
            Status = serviceRequest.Status.ToString()
        });
    }
}
