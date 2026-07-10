using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.UpdateServiceRequest;

public class UpdateServiceRequestCommandHandler : IRequestHandler<UpdateServiceRequestCommand, Result<UpdateServiceRequestResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<UpdateServiceRequestCommandHandler> _logger;

    public UpdateServiceRequestCommandHandler(IUnitOfWork unitOfWork, ILogger<UpdateServiceRequestCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<UpdateServiceRequestResult>> Handle(UpdateServiceRequestCommand command, CancellationToken cancellationToken)
    {
        var req = command.Request;

        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<UpdateServiceRequestResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<UpdateServiceRequestResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdAsync(command.ServiceRequestId, cancellationToken);
        if (serviceRequest == null)
            return Result<UpdateServiceRequestResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<UpdateServiceRequestResult>.Failure("No tienes permisos para modificar esta solicitud", "FORBIDDEN");

        try
        {
            var hasChanges = false;

            if (!string.IsNullOrWhiteSpace(req.Title) || req.Description != null || req.Location != null)
            {
                var title = string.IsNullOrWhiteSpace(req.Title) ? serviceRequest.Title : req.Title;
                var description = req.Description ?? serviceRequest.Description;
                var location = req.Location ?? serviceRequest.Location;
                serviceRequest.UpdateDetails(title, description, location);
                hasChanges = true;
            }

            if (req.Price.HasValue)
            {
                serviceRequest.UpdatePrice(req.Price.Value);
                hasChanges = true;
            }

            if (hasChanges)
            {
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
                    _logger.LogError(ex, "Error al actualizar la solicitud de servicio {Id}", command.ServiceRequestId);
                    return Result<UpdateServiceRequestResult>.Failure("Error al actualizar la solicitud de servicio", "UPDATE_SERVICE_REQUEST_ERROR");
                }
            }
        }
        catch (DomainException ex)
        {
            return Result<UpdateServiceRequestResult>.Failure(ex.Message, ex.ErrorCode);
        }

        var dto = new ServiceRequestDetailDto
        {
            Id = serviceRequest.Id,
            Title = serviceRequest.Title,
            Description = serviceRequest.Description,
            Location = serviceRequest.Location,
            Status = serviceRequest.Status.ToString(),
            Price = serviceRequest.Price,
            ClientId = serviceRequest.ClientId,
            FreelancerPickedId = serviceRequest.FreelancerPickedId,
            ApplicationsCount = serviceRequest.FreelancerApplications.Count,
            Photos = serviceRequest.Photos.Select(p => new ServiceRequestPhotoDto
            {
                Id = p.Id,
                FilePath = p.FilePath
            }).ToList(),
            CreatedAt = serviceRequest.CreatedAt,
            UpdatedAt = serviceRequest.UpdatedAt
        };
        return Result<UpdateServiceRequestResult>.Success(new UpdateServiceRequestResult { ServiceRequest = dto });
    }
}
