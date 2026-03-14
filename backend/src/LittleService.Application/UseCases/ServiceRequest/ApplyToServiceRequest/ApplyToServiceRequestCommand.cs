using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.ApplyToServiceRequest;

public class ApplyToServiceRequestCommand : IRequest<Result<ApplyToServiceRequestResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
