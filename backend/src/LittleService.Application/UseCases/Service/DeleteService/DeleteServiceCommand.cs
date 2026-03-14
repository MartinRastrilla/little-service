using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Service.DeleteService;

public class DeleteServiceCommand : IRequest<Result<DeleteServiceResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceId { get; set; }
}
