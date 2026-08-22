using LittleService.Application.DTOs.Messages;

namespace LittleService.Application.UseCases.Message.GetServiceRequestConversations;

public class GetServiceRequestConversationsResult
{
    public IList<ConversationSummaryDto> Conversations { get; set; } = new List<ConversationSummaryDto>();
}
