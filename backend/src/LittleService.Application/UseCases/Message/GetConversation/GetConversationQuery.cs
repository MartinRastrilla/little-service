using LittleService.Application.Common;
using LittleService.Application.DTOs.Messages;
using Mediator;

namespace LittleService.Application.UseCases.Message.GetConversation;

public class GetConversationQuery : IRequest<Result<GetConversationResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
    public Guid WithUserId { get; set; }
    public DateTime? Cursor { get; set; }
    public int Limit { get; set; } = 50;
}
