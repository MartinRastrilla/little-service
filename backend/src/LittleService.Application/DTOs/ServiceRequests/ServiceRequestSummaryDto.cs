namespace LittleService.Application.DTOs.ServiceRequests;

public class ServiceRequestSummaryDto
{
    public Guid Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Location { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public string DisplayStatus { get; set; } = string.Empty;
    public decimal? Price { get; set; }
    public Guid ClientId { get; set; }
    public Guid? FreelancerPickedId { get; set; }
    public int PhotosCount { get; set; }
    public string? ContractStatus { get; set; }
    public string? CoverPhotoUrl { get; set; }
    public DateTime CreatedAt { get; set; }
}
