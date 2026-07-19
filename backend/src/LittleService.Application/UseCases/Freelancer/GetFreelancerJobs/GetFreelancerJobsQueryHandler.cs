using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerJobs;

public class GetFreelancerJobsQueryHandler
    : IRequestHandler<GetFreelancerJobsQuery, Result<GetFreelancerJobsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly FreelancerWorkItemSummaryMapper _mapper;
    private readonly ILogger<GetFreelancerJobsQueryHandler> _logger;

    public GetFreelancerJobsQueryHandler(
        IUnitOfWork unitOfWork,
        FreelancerWorkItemSummaryMapper mapper,
        ILogger<GetFreelancerJobsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetFreelancerJobsResult>> Handle(
        GetFreelancerJobsQuery query,
        CancellationToken cancellationToken)
    {
        if (!FreelancerJobFilterPredicateBuilder.IsValidFilter(query.Filter))
        {
            return Result<GetFreelancerJobsResult>.Failure(
                "Filtro de estado inválido",
                "INVALID_FILTER");
        }

        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetFreelancerJobsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetFreelancerJobsResult>.Failure(
                "Perfil de freelancer no encontrado",
                "FREELANCER_NOT_FOUND");

        var summaries = await _unitOfWork.ServiceRequests.GetFreelancerJobSummariesAsync(
            user.Freelancer.Id,
            user.Id,
            query.Filter,
            cancellationToken);

        var items = _mapper.MapJobs(summaries);

        // TODO(future): migrate to paginated response { items, totalCount, hasMore }.
        _logger.LogInformation(
            "Listados {Count} trabajos para freelancer {FreelancerId}",
            items.Count,
            user.Freelancer.Id);

        return Result<GetFreelancerJobsResult>.Success(new GetFreelancerJobsResult
        {
            Items = items
        });
    }
}
