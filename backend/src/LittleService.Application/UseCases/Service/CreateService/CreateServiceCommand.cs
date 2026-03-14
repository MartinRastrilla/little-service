using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Service.CreateService;

public class CreateServiceCommand : IRequest<Result<CreateServiceResult>>
{
    public Guid UserId { get; set; }
    public CreateServiceRequest Request { get; set; } = null!;
}
