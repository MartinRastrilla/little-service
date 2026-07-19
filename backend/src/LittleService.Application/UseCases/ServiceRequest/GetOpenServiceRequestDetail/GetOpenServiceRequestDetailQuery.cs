using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequestDetail;

public class GetOpenServiceRequestDetailQuery : IRequest<Result<GetOpenServiceRequestDetailResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
