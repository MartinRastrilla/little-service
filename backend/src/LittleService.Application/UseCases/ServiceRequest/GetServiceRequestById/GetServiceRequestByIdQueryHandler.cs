using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestById;

public class GetServiceRequestByIdQueryHandler : IRequestHandler<GetServiceRequestByIdQuery, Result<GetServiceRequestByIdResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<GetServiceRequestByIdQueryHandler> _logger;

    public GetServiceRequestByIdQueryHandler(IUnitOfWork unitOfWork, ILogger<GetServiceRequestByIdQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<GetServiceRequestByIdResult>> Handle(GetServiceRequestByIdQuery query, CancellationToken cancellationToken)
    {
        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(query.ServiceRequestId, cancellationToken);
        if (serviceRequest == null)
            return Result<GetServiceRequestByIdResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetServiceRequestByIdResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");

        var isClient = user.Client?.Id == serviceRequest.ClientId;
        var isAssignedFreelancer = user.Freelancer?.Id == serviceRequest.FreelancerPickedId;
        var hasApplied = user.Freelancer != null &&
            serviceRequest.FreelancerApplications.Any(fa => fa.FreelancerId == user.Freelancer.Id);

        if (!isClient && !isAssignedFreelancer && !hasApplied && user.Freelancer == null)
            return Result<GetServiceRequestByIdResult>.Failure("No tienes acceso a esta solicitud", "FORBIDDEN");

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
        return Result<GetServiceRequestByIdResult>.Success(new GetServiceRequestByIdResult { ServiceRequest = dto });
    }
}
