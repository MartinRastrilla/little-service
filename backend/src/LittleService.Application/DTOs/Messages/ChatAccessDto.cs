namespace LittleService.Application.DTOs.Messages;

public class ChatAccessDto
{
    public bool CanOpen { get; set; }
    public bool CanSend { get; set; }
    public bool IsReadOnly { get; set; }
    public bool WaitingForClientMessage { get; set; }
    public string? BlockedReason { get; set; }
}
