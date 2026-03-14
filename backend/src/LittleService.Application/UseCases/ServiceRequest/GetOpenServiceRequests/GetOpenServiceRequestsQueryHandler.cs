using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequests;

public class GetOpenServiceRequestsQueryHandler : IRequestHandler<GetOpenServiceRequestsQuery, Result<GetOpenServiceRequestsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<GetOpenServiceRequestsQueryHandler> _logger;

    public GetOpenServiceRequestsQueryHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<GetOpenServiceRequestsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetOpenServiceRequestsResult>> Handle(GetOpenServiceRequestsQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetOpenServiceRequestsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetOpenServiceRequestsResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var openRequests = await _unitOfWork.ServiceRequests.GetOpenRequestsAsync(cancellationToken);

        // Exclude requests from service requests this freelancer already applied to
        var freelancerApplications = await _unitOfWork.FreelancerApplications.GetByFreelancerIdAsync(user.Freelancer.Id, cancellationToken);
        var appliedRequestIds = freelancerApplications.Select(fa => fa.ServiceRequestId).ToHashSet();

        var available = openRequests
            .Where(sr => sr.ClientId != user.Freelancer.Id && !appliedRequestIds.Contains(sr.Id))
            .ToList();

        var dtos = _mapper.Map<IList<ServiceRequestSummaryDto>>(available);
        return Result<GetOpenServiceRequestsResult>.Success(new GetOpenServiceRequestsResult { ServiceRequests = dtos });
    }
}
