using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetMyServiceRequests;

public class GetMyServiceRequestsQueryHandler : IRequestHandler<GetMyServiceRequestsQuery, Result<GetMyServiceRequestsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<GetMyServiceRequestsQueryHandler> _logger;

    public GetMyServiceRequestsQueryHandler(IUnitOfWork unitOfWork, ILogger<GetMyServiceRequestsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<GetMyServiceRequestsResult>> Handle(GetMyServiceRequestsQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetMyServiceRequestsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<GetMyServiceRequestsResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var summaries = await _unitOfWork.ServiceRequests.GetSummariesByClientIdAsync(user.Client.Id, cancellationToken);
        var dtos = summaries.Select(sr => new ServiceRequestSummaryDto
        {
            Id = sr.Id,
            Title = sr.Title,
            Description = sr.Description,
            Location = sr.Location,
            Status = sr.Status.ToString(),
            Price = sr.Price,
            ClientId = sr.ClientId,
            FreelancerPickedId = sr.FreelancerPickedId,
            PhotosCount = sr.PhotosCount,
            CreatedAt = sr.CreatedAt
        }).ToList();

        return Result<GetMyServiceRequestsResult>.Success(new GetMyServiceRequestsResult { ServiceRequests = dtos });
    }
}
