using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetApplicationsByServiceRequest;

public class GetApplicationsByServiceRequestQuery : IRequest<Result<GetApplicationsByServiceRequestResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
