namespace LittleService.Domain.Entities;

public class ServiceRequestPhoto : BaseEntity
{
    public Guid ServiceRequestId { get; set; }
    public ServiceRequest ServiceRequest { get; set; } = null!;

    public string FilePath { get; set; } = null!;
}