using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.CreateServiceRequest;

public class CreateServiceRequestCommand : IRequest<Result<CreateServiceRequestResult>>
{
    public Guid UserId { get; set; }
    public CreateServiceRequestRequest Request { get; set; } = null!;
}
