using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequests;

public class GetOpenServiceRequestsQueryHandler : IRequestHandler<GetOpenServiceRequestsQuery, Result<GetOpenServiceRequestsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<GetOpenServiceRequestsQueryHandler> _logger;

    public GetOpenServiceRequestsQueryHandler(IUnitOfWork unitOfWork, ILogger<GetOpenServiceRequestsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<GetOpenServiceRequestsResult>> Handle(GetOpenServiceRequestsQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetOpenServiceRequestsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetOpenServiceRequestsResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var openSummaries = await _unitOfWork.ServiceRequests.GetOpenSummariesAsync(cancellationToken);

        var freelancerApplications = await _unitOfWork.FreelancerApplications.GetSummariesByFreelancerIdAsync(user.Freelancer.Id, cancellationToken);
        var appliedRequestIds = freelancerApplications.Select(fa => fa.ServiceRequestId).ToHashSet();

        var dtos = openSummaries
            .Where(sr => sr.ClientId != user.Freelancer.Id && !appliedRequestIds.Contains(sr.Id))
            .Select(sr => new ServiceRequestSummaryDto
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
            })
            .ToList();

        return Result<GetOpenServiceRequestsResult>.Success(new GetOpenServiceRequestsResult { ServiceRequests = dtos });
    }
}
