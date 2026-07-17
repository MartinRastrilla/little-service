using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestInfo;

public class GetServiceRequestInfoQuery : IRequest<Result<GetServiceRequestInfoResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
