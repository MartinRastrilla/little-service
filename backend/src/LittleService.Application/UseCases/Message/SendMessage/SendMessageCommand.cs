using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Message.SendMessage;

public class SendMessageCommand : IRequest<Result<SendMessageResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
    public Guid ToUserId { get; set; }
    public string Content { get; set; } = string.Empty;
}
