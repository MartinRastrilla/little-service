using LittleService.Application.DTOs.Messages;

namespace LittleService.Application.UseCases.Message.GetConversation;

public class GetConversationResult
{
    public PagedMessagesDto Messages { get; set; } = new();
}
