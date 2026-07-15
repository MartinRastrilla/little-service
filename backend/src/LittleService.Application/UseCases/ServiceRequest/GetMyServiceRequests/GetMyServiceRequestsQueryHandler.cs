using LittleService.Application.Common;
using LittleService.Application.DTOs.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetMyServiceRequests;

public class GetMyServiceRequestsQueryHandler : IRequestHandler<GetMyServiceRequestsQuery, Result<GetMyServiceRequestsResult>>
{
    private const int MaxPageSize = 50;

    private readonly IUnitOfWork _unitOfWork;
    private readonly ServiceRequestSummaryMapper _summaryMapper;
    private readonly ILogger<GetMyServiceRequestsQueryHandler> _logger;

    public GetMyServiceRequestsQueryHandler(
        IUnitOfWork unitOfWork,
        ServiceRequestSummaryMapper summaryMapper,
        ILogger<GetMyServiceRequestsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _summaryMapper = summaryMapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetMyServiceRequestsResult>> Handle(GetMyServiceRequestsQuery query, CancellationToken cancellationToken)
    {
        if (query.Page < 1)
            return Result<GetMyServiceRequestsResult>.Failure("La página debe ser mayor o igual a 1", "INVALID_PAGE");

        if (query.PageSize < 1 || query.PageSize > MaxPageSize)
            return Result<GetMyServiceRequestsResult>.Failure($"El tamaño de página debe estar entre 1 y {MaxPageSize}", "INVALID_PAGE_SIZE");

        if (!string.IsNullOrWhiteSpace(query.Filter) &&
            ServiceRequestFilterPredicateBuilder.Build(query.Filter) == null)
        {
            return Result<GetMyServiceRequestsResult>.Failure("Filtro de estado inválido", "INVALID_FILTER");
        }

        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetMyServiceRequestsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<GetMyServiceRequestsResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var (summaries, totalCount) = await _unitOfWork.ServiceRequests.GetSummariesByClientIdPagedAsync(
            user.Client.Id,
            query.Filter,
            query.Search,
            query.Page,
            query.PageSize,
            cancellationToken);

        var dtos = _summaryMapper.MapMany(summaries);
        var hasMore = query.Page * query.PageSize < totalCount;

        return Result<GetMyServiceRequestsResult>.Success(new GetMyServiceRequestsResult
        {
            ServiceRequests = new PagedResultDto<ServiceRequestSummaryDto>
            {
                Items = dtos,
                TotalCount = totalCount,
                Page = query.Page,
                PageSize = query.PageSize,
                HasMore = hasMore
            }
        });
    }
}
