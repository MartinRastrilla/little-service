using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestActivity;

public class GetServiceRequestActivityQuery : IRequest<Result<GetServiceRequestActivityResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
