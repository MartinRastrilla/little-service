using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Mappers;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.AcceptApplication;

public class AcceptApplicationCommandHandler : IRequestHandler<AcceptApplicationCommand, Result<AcceptApplicationResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<AcceptApplicationCommandHandler> _logger;

    public AcceptApplicationCommandHandler(IUnitOfWork unitOfWork, ILogger<AcceptApplicationCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<AcceptApplicationResult>> Handle(AcceptApplicationCommand command, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<AcceptApplicationResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<AcceptApplicationResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(command.ServiceRequestId, cancellationToken);
        if (serviceRequest == null)
            return Result<AcceptApplicationResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<AcceptApplicationResult>.Failure("No tienes permisos para gestionar esta solicitud", "FORBIDDEN");

        var application = serviceRequest.FreelancerApplications.FirstOrDefault(fa => fa.Id == command.ApplicationId);
        if (application == null)
            return Result<AcceptApplicationResult>.Failure("Aplicación no encontrada", "APPLICATION_NOT_FOUND");

        try
        {
            application.Accept(serviceRequest);
        }
        catch (DomainException ex)
        {
            return Result<AcceptApplicationResult>.Failure(ex.Message, ex.ErrorCode);
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
            _logger.LogError(ex, "Error al aceptar la aplicación {ApplicationId}", command.ApplicationId);
            return Result<AcceptApplicationResult>.Failure("Error al aceptar la aplicación", "ACCEPT_APPLICATION_ERROR");
        }

        _logger.LogInformation("Aplicación {ApplicationId} aceptada para ServiceRequest {ServiceRequestId}", command.ApplicationId, command.ServiceRequestId);
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
            DisplayStatus = FreelancerApplicationDisplayStatusResolver.ResolveForClientView(
                application.Status,
                serviceRequest.CanAcceptApplications()),
            CreatedAt = application.CreatedAt
        };
        return Result<AcceptApplicationResult>.Success(new AcceptApplicationResult { Application = dto });
    }
}
