using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestActivity;

public class GetServiceRequestActivityQueryHandler
    : IRequestHandler<GetServiceRequestActivityQuery, Result<GetServiceRequestActivityResult>>
{
    private const int RecentApplicationsLimit = 3;

    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<GetServiceRequestActivityQueryHandler> _logger;

    public GetServiceRequestActivityQueryHandler(
        IUnitOfWork unitOfWork,
        IFileStorageService fileStorageService,
        ILogger<GetServiceRequestActivityQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<GetServiceRequestActivityResult>> Handle(
        GetServiceRequestActivityQuery query,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetServiceRequestActivityResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<GetServiceRequestActivityResult>.Failure(
                "Perfil de cliente no encontrado",
                "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            query.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<GetServiceRequestActivityResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<GetServiceRequestActivityResult>.Failure(
                "No tienes permisos para ver esta solicitud",
                "FORBIDDEN");

        var applicationsCount = await _unitOfWork.FreelancerApplications
            .GetPendingCountByServiceRequestIdAsync(query.ServiceRequestId, cancellationToken);

        var messagesCount = await _unitOfWork.Messages
            .GetActiveConversationsCountByServiceRequestIdAsync(
                query.ServiceRequestId,
                user.Id,
                cancellationToken);

        var showRecentApplications = serviceRequest.CanAcceptApplications();
        var recentApplications = new List<FreelancerApplicationSummaryDto>();

        if (showRecentApplications)
        {
            var summaries = await _unitOfWork.FreelancerApplications
                .GetRecentPendingSummariesByServiceRequestIdAsync(
                    query.ServiceRequestId,
                    RecentApplicationsLimit,
                    cancellationToken);

            recentApplications = summaries.Select(MapApplicationSummary).ToList();
        }

        var dto = new ServiceRequestActivityDto
        {
            MessagesCount = messagesCount,
            ApplicationsCount = applicationsCount,
            ShowRecentApplications = showRecentApplications,
            Timeline = ServiceRequestTimelineResolver.Resolve(serviceRequest),
            RecentApplications = recentApplications,
        };

        return Result<GetServiceRequestActivityResult>.Success(new GetServiceRequestActivityResult
        {
            Activity = dto,
        });
    }

    private FreelancerApplicationSummaryDto MapApplicationSummary(
        Domain.Queries.FreelancerApplicationSummaryReadModel summary)
    {
        return new FreelancerApplicationSummaryDto
        {
            Id = summary.Id,
            ServiceRequestId = summary.ServiceRequestId,
            FreelancerId = summary.FreelancerId,
            FreelancerName = summary.FreelancerName,
            FreelancerProfilePicture = summary.FreelancerProfilePicture != null
                ? _fileStorageService.GetFileUrl(summary.FreelancerProfilePicture)
                : null,
            RatingAverage = summary.RatingAverage,
            RatingCount = summary.RatingCount,
            Bio = summary.Bio,
            Status = summary.Status.ToString(),
            DisplayStatus = FreelancerApplicationDisplayStatusResolver.ResolveForClientView(
                summary.Status,
                canManageApplications: true),
            CreatedAt = summary.CreatedAt,
        };
    }
}
