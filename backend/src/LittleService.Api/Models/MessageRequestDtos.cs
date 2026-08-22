namespace LittleService.Api.Models;

public class SendMessageRequestDto
{
    public Guid ToUserId { get; set; }
    public string Content { get; set; } = string.Empty;
}

public class MarkConversationAsReadRequestDto
{
    public Guid WithUserId { get; set; }
}
