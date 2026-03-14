namespace LittleService.Application.DTOs.ServiceRequests;

public class ServiceRequestPhotoDto
{
    public Guid Id { get; set; }
    public string FilePath { get; set; } = string.Empty;
}
