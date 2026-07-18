using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequests;

public class GetOpenServiceRequestsQuery : IRequest<Result<GetOpenServiceRequestsResult>>
{
    public Guid UserId { get; set; }
    public string? Search { get; set; }
    public string? Filter { get; set; }
    public int? TimezoneOffsetMinutes { get; set; }
}
