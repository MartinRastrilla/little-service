using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestProfessional;

public class GetServiceRequestProfessionalQuery : IRequest<Result<GetServiceRequestProfessionalResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
