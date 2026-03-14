using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequests;

public class GetOpenServiceRequestsQuery : IRequest<Result<GetOpenServiceRequestsResult>>
{
    public Guid UserId { get; set; }
}
