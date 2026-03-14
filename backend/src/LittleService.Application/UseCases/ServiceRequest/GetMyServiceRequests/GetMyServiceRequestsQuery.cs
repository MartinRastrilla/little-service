using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetMyServiceRequests;

public class GetMyServiceRequestsQuery : IRequest<Result<GetMyServiceRequestsResult>>
{
    public Guid UserId { get; set; }
}
