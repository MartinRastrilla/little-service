namespace LittleService.Api.Models;

public class MessagesReadEventDto
{
    public Guid ServiceRequestId { get; set; }
    public Guid ReadByUserId { get; set; }
    public Guid WithUserId { get; set; }
    public DateTime ReadAt { get; set; }
}
