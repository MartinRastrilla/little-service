using LittleService.Application.DTOs.Messages;

namespace LittleService.Application.UseCases.Message.SendMessage;

public class SendMessageResult
{
    public MessageDto Message { get; set; } = null!;
}
