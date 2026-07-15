namespace LittleService.Domain.Entities;

public class ServiceRequestPhoto : BaseEntity
{
    public Guid ServiceRequestId { get; set; }
    public ServiceRequest ServiceRequest { get; set; } = null!;

    public string FilePath { get; set; } = null!;

    private ServiceRequestPhoto() { }

    public static ServiceRequestPhoto Create(Guid serviceRequestId, string filePath)
    {
        return new ServiceRequestPhoto
        {
            Id = Guid.NewGuid(),
            ServiceRequestId = serviceRequestId,
            FilePath = filePath,
            CreatedAt = DateTime.UtcNow
        };
    }
}