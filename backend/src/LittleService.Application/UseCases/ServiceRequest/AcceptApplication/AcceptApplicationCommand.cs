using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.AcceptApplication;

public class AcceptApplicationCommand : IRequest<Result<AcceptApplicationResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
    public Guid ApplicationId { get; set; }
}
