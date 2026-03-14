using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.CancelServiceRequest;

public class CancelServiceRequestCommand : IRequest<Result<CancelServiceRequestResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
