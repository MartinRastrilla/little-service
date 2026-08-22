using LittleService.Application.DTOs.Messages;

namespace LittleService.Application.UseCases.Message.GetMyInbox;

public class GetMyInboxResult
{
    public IList<InboxServiceRequestGroupDto> Inbox { get; set; } = new List<InboxServiceRequestGroupDto>();
}
