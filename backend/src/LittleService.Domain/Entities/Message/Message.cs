namespace LittleService.Domain.Entities;

public class Message : BaseEntity
{
    public Guid FromUserId { get; set; }
    public User FromUser { get; set; } = null!;

    public Guid ToUserId { get; set; }
    public User ToUser { get; set; } = null!;

    public Guid ServiceRequestId { get; set; }
    public ServiceRequest ServiceRequest { get; set; } = null!;

    public string Content { get; set; } = null!;

    public bool IsRead { get; set; } = false;
}