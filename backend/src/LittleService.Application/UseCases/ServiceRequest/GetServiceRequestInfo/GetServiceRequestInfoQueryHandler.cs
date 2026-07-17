using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestInfo;

public class GetServiceRequestInfoQueryHandler : IRequestHandler<GetServiceRequestInfoQuery, Result<GetServiceRequestInfoResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<GetServiceRequestInfoQueryHandler> _logger;

    public GetServiceRequestInfoQueryHandler(
        IUnitOfWork unitOfWork,
        IFileStorageService fileStorageService,
        ILogger<GetServiceRequestInfoQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<GetServiceRequestInfoResult>> Handle(
        GetServiceRequestInfoQuery query,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetServiceRequestInfoResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<GetServiceRequestInfoResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            query.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<GetServiceRequestInfoResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<GetServiceRequestInfoResult>.Failure(
                "No tienes permisos para ver esta solicitud",
                "FORBIDDEN");

        var contractStatus = serviceRequest.Contract?.Status;
        var displayStatus = ServiceRequestDisplayStatusResolver.Resolve(
            serviceRequest.Status,
            serviceRequest.FreelancerPickedId,
            contractStatus);

        var applicationsCount = await _unitOfWork.FreelancerApplications
            .GetPendingCountByServiceRequestIdAsync(query.ServiceRequestId, cancellationToken);

        var messagesCount = await _unitOfWork.Messages
            .GetActiveConversationsCountByServiceRequestIdAsync(
                query.ServiceRequestId,
                user.Id,
                cancellationToken);

        var dto = new ServiceRequestInfoDto
        {
            Id = serviceRequest.Id,
            Title = serviceRequest.Title,
            Description = serviceRequest.Description,
            Location = serviceRequest.Location,
            Status = serviceRequest.Status.ToString(),
            DisplayStatus = displayStatus,
            ContractStatus = contractStatus?.ToString(),
            Price = serviceRequest.Price,
            PriceMode = serviceRequest.Price.HasValue ? "Estimated" : "ToBeAgreed",
            IsEditable = serviceRequest.IsEditable(),
            MessagesCount = messagesCount,
            ApplicationsCount = applicationsCount,
            Photos = serviceRequest.Photos.Select(p => new ServiceRequestPhotoDto
            {
                Id = p.Id,
                FilePath = _fileStorageService.GetFileUrl(p.FilePath)
            }).ToList(),
            CreatedAt = serviceRequest.CreatedAt
        };

        return Result<GetServiceRequestInfoResult>.Success(new GetServiceRequestInfoResult
        {
            ServiceRequest = dto
        });
    }
}
