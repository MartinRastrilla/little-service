using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Message.MarkConversationAsRead;

public class MarkConversationAsReadCommand : IRequest<Result<MarkConversationAsReadResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
    public Guid WithUserId { get; set; }
}
