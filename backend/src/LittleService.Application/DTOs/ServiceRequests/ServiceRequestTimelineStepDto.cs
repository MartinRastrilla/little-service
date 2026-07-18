namespace LittleService.Application.DTOs.ServiceRequests;

public class ServiceRequestTimelineStepDto
{
    public string Key { get; set; } = string.Empty;
    public string Title { get; set; } = string.Empty;
    public string Subtitle { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public DateTime? OccurredAt { get; set; }
}
