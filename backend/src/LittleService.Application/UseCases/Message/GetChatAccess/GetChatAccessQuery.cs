using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Message.GetChatAccess;

public class GetChatAccessQuery : IRequest<Result<GetChatAccessResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
    public Guid WithUserId { get; set; }
}
