using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequests;

public class GetOpenServiceRequestsQueryHandler : IRequestHandler<GetOpenServiceRequestsQuery, Result<GetOpenServiceRequestsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ServiceRequestSummaryMapper _summaryMapper;
    private readonly ILogger<GetOpenServiceRequestsQueryHandler> _logger;

    public GetOpenServiceRequestsQueryHandler(
        IUnitOfWork unitOfWork,
        ServiceRequestSummaryMapper summaryMapper,
        ILogger<GetOpenServiceRequestsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _summaryMapper = summaryMapper;
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

        var filteredSummaries = openSummaries
            .Where(sr => sr.ClientId != user.Freelancer.Id && !appliedRequestIds.Contains(sr.Id));

        var dtos = _summaryMapper.MapMany(filteredSummaries);

        return Result<GetOpenServiceRequestsResult>.Success(new GetOpenServiceRequestsResult { ServiceRequests = dtos });
    }
}
