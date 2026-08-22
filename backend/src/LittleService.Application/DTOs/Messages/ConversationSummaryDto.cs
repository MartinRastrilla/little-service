namespace LittleService.Application.DTOs.Messages;

public class ConversationSummaryDto
{
    public Guid ServiceRequestId { get; set; }
    public Guid WithUserId { get; set; }
    public string WithUserName { get; set; } = string.Empty;
    public string? WithUserProfilePictureUrl { get; set; }
    public string? LastMessageContent { get; set; }
    public DateTime? LastMessageAt { get; set; }
    public int UnreadCount { get; set; }
    public bool CanSend { get; set; }
    public bool IsReadOnly { get; set; }
    public bool WaitingForClientMessage { get; set; }
    public string? BlockedReason { get; set; }
}
