using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.CancelServiceRequestEngagement;

public class CancelServiceRequestEngagementCommandHandler
    : IRequestHandler<CancelServiceRequestEngagementCommand, Result<CancelServiceRequestEngagementResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<CancelServiceRequestEngagementCommandHandler> _logger;

    public CancelServiceRequestEngagementCommandHandler(
        IUnitOfWork unitOfWork,
        ILogger<CancelServiceRequestEngagementCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<CancelServiceRequestEngagementResult>> Handle(
        CancelServiceRequestEngagementCommand command,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<CancelServiceRequestEngagementResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<CancelServiceRequestEngagementResult>.Failure(
                "Perfil de cliente no encontrado",
                "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            command.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<CancelServiceRequestEngagementResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<CancelServiceRequestEngagementResult>.Failure(
                "No tienes permisos para gestionar esta solicitud",
                "FORBIDDEN");

        if (!serviceRequest.FreelancerPickedId.HasValue)
            return Result<CancelServiceRequestEngagementResult>.Failure(
                "Este pedido no tiene un profesional asignado.",
                "NO_ASSIGNED_PROFESSIONAL");

        var acceptedApplication = serviceRequest.FreelancerApplications
            .FirstOrDefault(a =>
                a.FreelancerId == serviceRequest.FreelancerPickedId.Value &&
                a.IsAccepted());

        if (acceptedApplication == null)
            return Result<CancelServiceRequestEngagementResult>.Failure(
                "No se encontró la postulación aceptada del profesional",
                "ACCEPTED_APPLICATION_NOT_FOUND");

        try
        {
            serviceRequest.RevokeEngagement(serviceRequest.Contract, acceptedApplication);
        }
        catch (DomainException ex)
        {
            return Result<CancelServiceRequestEngagementResult>.Failure(ex.Message, ex.ErrorCode);
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
            _logger.LogError(
                ex,
                "Error al cancelar la contratación del pedido {ServiceRequestId}",
                command.ServiceRequestId);
            return Result<CancelServiceRequestEngagementResult>.Failure(
                "Error al cancelar la contratación",
                "CANCEL_ENGAGEMENT_ERROR");
        }

        _logger.LogInformation(
            "Contratación cancelada para el pedido {ServiceRequestId}",
            command.ServiceRequestId);

        var dto = ServiceRequestProfessionalMapper.Map(serviceRequest);

        return Result<CancelServiceRequestEngagementResult>.Success(new CancelServiceRequestEngagementResult
        {
            Professional = dto
        });
    }
}
