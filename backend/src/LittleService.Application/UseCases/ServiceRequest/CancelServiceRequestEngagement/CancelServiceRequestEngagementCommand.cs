using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.CancelServiceRequestEngagement;

public class CancelServiceRequestEngagementCommand : IRequest<Result<CancelServiceRequestEngagementResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
