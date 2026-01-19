namespace LittleService.Domain.Entities;

public class ActivityLog : BaseEntity
{
    public Guid UserId { get; set; }
    public User User { get; set; } = null!;

    public string Action { get; set; } = null!;
    public string Details { get; set; } = string.Empty;
    public string IpAddress { get; set; } = string.Empty;

}