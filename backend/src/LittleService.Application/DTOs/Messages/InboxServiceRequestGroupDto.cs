namespace LittleService.Application.DTOs.Messages;

public class InboxServiceRequestGroupDto
{
    public Guid ServiceRequestId { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public IList<ConversationSummaryDto> Conversations { get; set; } = new List<ConversationSummaryDto>();
}
