namespace LittleService.Domain.Entities;

public class Report : BaseEntity
{
    public Guid ReporterId { get; set; }
    public User Reporter { get; set; } = null!;

    public Guid ReportedUserId { get; set; }
    public User ReportedUser { get; set; } = null!;

    public Guid? ServiceRequestId { get; set; }
    public ServiceRequest? ServiceRequest { get; set; }

    public string Reason { get; set; } = null!;
    public string Description { get; set; } = null!;
}
