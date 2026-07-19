using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequestDetail;

public class GetOpenServiceRequestDetailQueryHandler
    : IRequestHandler<GetOpenServiceRequestDetailQuery, Result<GetOpenServiceRequestDetailResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<GetOpenServiceRequestDetailQueryHandler> _logger;

    public GetOpenServiceRequestDetailQueryHandler(
        IUnitOfWork unitOfWork,
        IFileStorageService fileStorageService,
        ILogger<GetOpenServiceRequestDetailQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<GetOpenServiceRequestDetailResult>> Handle(
        GetOpenServiceRequestDetailQuery query,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetOpenServiceRequestDetailResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetOpenServiceRequestDetailResult>.Failure(
                "Perfil de freelancer no encontrado",
                "FREELANCER_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            query.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<GetOpenServiceRequestDetailResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        var isOpened = serviceRequest.Status == ServiceRequestStatus.Opened;
        var isAssignedFreelancer = serviceRequest.FreelancerPickedId == user.Freelancer.Id;
        if (!isOpened && !isAssignedFreelancer)
            return Result<GetOpenServiceRequestDetailResult>.Failure(
                "No tienes permisos para ver esta solicitud",
                "FORBIDDEN");

        var application = await _unitOfWork.FreelancerApplications.GetByServiceRequestAndFreelancerAsync(
            query.ServiceRequestId,
            user.Freelancer.Id,
            cancellationToken);

        var contractStatus = serviceRequest.Contract?.Status;
        var displayStatus = ServiceRequestDisplayStatusResolver.Resolve(
            serviceRequest.Status,
            serviceRequest.FreelancerPickedId,
            contractStatus);

        var publishedJobsCount = await _unitOfWork.ServiceRequests.CountByClientIdExcludingCancelledAsync(
            serviceRequest.ClientId,
            cancellationToken);

        var canApply = serviceRequest.CanAcceptApplications() && application == null;

        var dto = new OpenServiceRequestDetailDto
        {
            Id = serviceRequest.Id,
            Title = serviceRequest.Title,
            Description = serviceRequest.Description,
            Location = serviceRequest.Location,
            Status = serviceRequest.Status.ToString(),
            DisplayStatus = displayStatus,
            Price = serviceRequest.Price,
            PriceMode = serviceRequest.Price.HasValue ? "Estimated" : "ToBeAgreed",
            PhotosCount = serviceRequest.Photos.Count,
            ApplicationsCount = serviceRequest.FreelancerApplications.Count,
            Photos = serviceRequest.Photos.Select(p => new ServiceRequestPhotoDto
            {
                Id = p.Id,
                FilePath = _fileStorageService.GetFileUrl(p.FilePath)
            }).ToList(),
            CreatedAt = serviceRequest.CreatedAt,
            CanApply = canApply,
            HasApplied = application != null,
            ApplicationStatus = application?.Status.ToString(),
            ApplicationId = application?.Id,
            Client = new ClientSummaryDto
            {
                ClientId = serviceRequest.ClientId,
                ClientName = serviceRequest.Client.User?.Name ?? string.Empty,
                ClientProfilePictureUrl = serviceRequest.Client.User?.ProfilePictureUrl != null
                    ? serviceRequest.Client.User.ProfilePictureUrl
                    : null,
                RatingLabel = "Sin calificaciones",
                PublishedJobsCount = publishedJobsCount
            }
        };

        return Result<GetOpenServiceRequestDetailResult>.Success(
            new GetOpenServiceRequestDetailResult { ServiceRequest = dto });
    }
}
