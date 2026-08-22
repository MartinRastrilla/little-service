using LittleService.Application.DTOs.Messages;

namespace LittleService.Application.UseCases.Message.GetChatAccess;

public class GetChatAccessResult
{
    public ChatAccessDto Access { get; set; } = new();
}
