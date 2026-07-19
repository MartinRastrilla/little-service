using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerApplications;

public class GetFreelancerApplicationsQueryHandler
    : IRequestHandler<GetFreelancerApplicationsQuery, Result<GetFreelancerApplicationsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly FreelancerWorkItemSummaryMapper _mapper;
    private readonly ILogger<GetFreelancerApplicationsQueryHandler> _logger;

    public GetFreelancerApplicationsQueryHandler(
        IUnitOfWork unitOfWork,
        FreelancerWorkItemSummaryMapper mapper,
        ILogger<GetFreelancerApplicationsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetFreelancerApplicationsResult>> Handle(
        GetFreelancerApplicationsQuery query,
        CancellationToken cancellationToken)
    {
        var statusFilter = ParseStatusFilter(query.Status);
        if (statusFilter == ParseStatusFilterResult.Invalid)
        {
            return Result<GetFreelancerApplicationsResult>.Failure(
                "Filtro de estado inválido",
                "INVALID_FILTER");
        }

        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetFreelancerApplicationsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetFreelancerApplicationsResult>.Failure(
                "Perfil de freelancer no encontrado",
                "FREELANCER_NOT_FOUND");

        var summaries = await _unitOfWork.FreelancerApplications.GetWorkItemSummariesByFreelancerIdAsync(
            user.Freelancer.Id,
            statusFilter.Value,
            cancellationToken);

        var items = _mapper.MapApplications(summaries);

        // TODO(future): migrate to paginated response { items, totalCount, hasMore }.
        _logger.LogInformation(
            "Listadas {Count} postulaciones para freelancer {FreelancerId}",
            items.Count,
            user.Freelancer.Id);

        return Result<GetFreelancerApplicationsResult>.Success(new GetFreelancerApplicationsResult
        {
            Items = items
        });
    }

    private static ParseStatusFilterResult ParseStatusFilter(string? status)
    {
        if (string.IsNullOrWhiteSpace(status) || status.Trim().Equals("all", StringComparison.OrdinalIgnoreCase))
            return new ParseStatusFilterResult(null);

        return status.Trim().ToLowerInvariant() switch
        {
            "pending" => new ParseStatusFilterResult(FreelancerApplicationStatus.Pending),
            "accepted" => new ParseStatusFilterResult(FreelancerApplicationStatus.Accepted),
            "rejected" => new ParseStatusFilterResult(FreelancerApplicationStatus.Rejected),
            _ => ParseStatusFilterResult.Invalid
        };
    }

    private sealed class ParseStatusFilterResult
    {
        public static readonly ParseStatusFilterResult Invalid = new(null, true);

        public FreelancerApplicationStatus? Value { get; }
        public bool IsInvalid { get; }

        public ParseStatusFilterResult(FreelancerApplicationStatus? value, bool isInvalid = false)
        {
            Value = value;
            IsInvalid = isInvalid;
        }
    }
}
