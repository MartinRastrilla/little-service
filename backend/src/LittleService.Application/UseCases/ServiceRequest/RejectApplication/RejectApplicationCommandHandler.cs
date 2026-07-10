using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.RejectApplication;

public class RejectApplicationCommandHandler : IRequestHandler<RejectApplicationCommand, Result<RejectApplicationResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<RejectApplicationCommandHandler> _logger;

    public RejectApplicationCommandHandler(IUnitOfWork unitOfWork, ILogger<RejectApplicationCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<RejectApplicationResult>> Handle(RejectApplicationCommand command, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<RejectApplicationResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<RejectApplicationResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(command.ServiceRequestId, cancellationToken);
        if (serviceRequest == null)
            return Result<RejectApplicationResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<RejectApplicationResult>.Failure("No tienes permisos para gestionar esta solicitud", "FORBIDDEN");

        var application = serviceRequest.FreelancerApplications.FirstOrDefault(fa => fa.Id == command.ApplicationId);
        if (application == null)
            return Result<RejectApplicationResult>.Failure("Aplicación no encontrada", "APPLICATION_NOT_FOUND");

        try
        {
            application.Reject();
        }
        catch (DomainException ex)
        {
            return Result<RejectApplicationResult>.Failure(ex.Message, ex.ErrorCode);
        }

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.FreelancerApplications.UpdateAsync(application, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al rechazar la aplicación {ApplicationId}", command.ApplicationId);
            return Result<RejectApplicationResult>.Failure("Error al rechazar la aplicación", "REJECT_APPLICATION_ERROR");
        }

        _logger.LogInformation("Aplicación {ApplicationId} rechazada para ServiceRequest {ServiceRequestId}", command.ApplicationId, command.ServiceRequestId);
        var dto = new FreelancerApplicationSummaryDto
        {
            Id = application.Id,
            ServiceRequestId = application.ServiceRequestId,
            FreelancerId = application.FreelancerId,
            FreelancerName = application.Freelancer?.User?.Name ?? string.Empty,
            FreelancerProfilePicture = application.Freelancer?.User?.ProfilePictureUrl,
            RatingAverage = application.Freelancer?.RatingAverage ?? 0,
            RatingCount = application.Freelancer?.RatingCount ?? 0,
            Bio = application.Freelancer?.Bio,
            Status = application.Status.ToString(),
            CreatedAt = application.CreatedAt
        };
        return Result<RejectApplicationResult>.Success(new RejectApplicationResult { Application = dto });
    }
}
