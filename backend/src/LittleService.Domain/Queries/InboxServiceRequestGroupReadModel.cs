using LittleService.Domain.Entities.Enums;

namespace LittleService.Domain.Queries;

public class InboxServiceRequestGroupReadModel
{
    public Guid ServiceRequestId { get; init; }
    public string Title { get; init; } = string.Empty;
    public ServiceRequestStatus Status { get; init; }
    public IReadOnlyList<ConversationSummaryReadModel> Conversations { get; init; } = [];
}
