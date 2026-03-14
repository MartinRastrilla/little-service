using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.RejectApplication;

public class RejectApplicationCommand : IRequest<Result<RejectApplicationResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
    public Guid ApplicationId { get; set; }
}
