namespace LittleService.Domain.Queries;

public class ConversationSummaryReadModel
{
    public Guid ServiceRequestId { get; init; }
    public Guid WithUserId { get; init; }
    public string WithUserName { get; init; } = string.Empty;
    public string? WithUserProfilePicture { get; init; }
    public string? LastMessageContent { get; init; }
    public DateTime? LastMessageAt { get; init; }
    public int UnreadCount { get; init; }
}
