namespace LittleService.Application.DTOs.Messages;

public class PagedMessagesDto
{
    public IList<MessageDto> Items { get; set; } = new List<MessageDto>();
    public DateTime? NextCursor { get; set; }
    public bool HasMore { get; set; }
}
