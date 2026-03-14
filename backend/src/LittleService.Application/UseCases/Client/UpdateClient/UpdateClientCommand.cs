using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Client.UpdateClient;

public class UpdateClientCommand : IRequest<Result<UpdateClientResult>>
{
    public Guid UserId { get; set; }
    public UpdateClientRequest Request { get; set; } = null!;
}
