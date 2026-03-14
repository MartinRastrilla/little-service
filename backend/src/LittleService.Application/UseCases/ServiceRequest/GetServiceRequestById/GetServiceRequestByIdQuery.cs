using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestById;

public class GetServiceRequestByIdQuery : IRequest<Result<GetServiceRequestByIdResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
