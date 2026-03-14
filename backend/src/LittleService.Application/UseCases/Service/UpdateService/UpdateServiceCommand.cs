using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Service.UpdateService;

public class UpdateServiceCommand : IRequest<Result<UpdateServiceResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceId { get; set; }
    public UpdateServiceRequest Request { get; set; } = null!;
}
