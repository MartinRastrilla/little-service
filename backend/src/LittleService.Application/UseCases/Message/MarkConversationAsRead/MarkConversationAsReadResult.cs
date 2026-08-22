namespace LittleService.Application.UseCases.Message.MarkConversationAsRead;

public class MarkConversationAsReadResult
{
    public int MarkedCount { get; set; }
    public DateTime ReadAt { get; set; }
}
