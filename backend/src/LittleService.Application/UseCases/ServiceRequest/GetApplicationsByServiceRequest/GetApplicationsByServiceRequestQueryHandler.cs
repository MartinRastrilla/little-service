using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetApplicationsByServiceRequest;

public class GetApplicationsByServiceRequestQueryHandler : IRequestHandler<GetApplicationsByServiceRequestQuery, Result<GetApplicationsByServiceRequestResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<GetApplicationsByServiceRequestQueryHandler> _logger;

    public GetApplicationsByServiceRequestQueryHandler(
        IUnitOfWork unitOfWork,
        IFileStorageService fileStorageService,
        ILogger<GetApplicationsByServiceRequestQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<GetApplicationsByServiceRequestResult>> Handle(GetApplicationsByServiceRequestQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetApplicationsByServiceRequestResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<GetApplicationsByServiceRequestResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdAsync(query.ServiceRequestId, cancellationToken);
        if (serviceRequest == null)
            return Result<GetApplicationsByServiceRequestResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<GetApplicationsByServiceRequestResult>.Failure("No tienes permisos para ver estas aplicaciones", "FORBIDDEN");

        var canManageApplications = serviceRequest.CanAcceptApplications();
        var contractStatus = serviceRequest.Contract?.Status;
        var serviceRequestDisplayStatus = ServiceRequestDisplayStatusResolver.Resolve(
            serviceRequest.Status,
            serviceRequest.FreelancerPickedId,
            contractStatus);

        var summaries = await _unitOfWork.FreelancerApplications.GetSummariesByServiceRequestIdAsync(query.ServiceRequestId, cancellationToken);
        var dtos = summaries.Select(fa => new FreelancerApplicationSummaryDto
        {
            Id = fa.Id,
            ServiceRequestId = fa.ServiceRequestId,
            FreelancerId = fa.FreelancerId,
            FreelancerName = fa.FreelancerName,
            FreelancerProfilePicture = fa.FreelancerProfilePicture != null
                ? _fileStorageService.GetFileUrl(fa.FreelancerProfilePicture)
                : null,
            RatingAverage = fa.RatingAverage,
            RatingCount = fa.RatingCount,
            Bio = fa.Bio,
            Status = fa.Status.ToString(),
            DisplayStatus = FreelancerApplicationDisplayStatusResolver.ResolveForClientView(
                fa.Status,
                canManageApplications),
            CreatedAt = fa.CreatedAt
        }).ToList();

        return Result<GetApplicationsByServiceRequestResult>.Success(new GetApplicationsByServiceRequestResult
        {
            Applications = dtos,
            CanManageApplications = canManageApplications,
            ServiceRequestTitle = serviceRequest.Title,
            ServiceRequestDisplayStatus = serviceRequestDisplayStatus,
        });
    }
}
