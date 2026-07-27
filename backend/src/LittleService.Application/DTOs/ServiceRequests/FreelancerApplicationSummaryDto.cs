namespace LittleService.Application.DTOs.ServiceRequests;

public class FreelancerApplicationSummaryDto
{
    public Guid Id { get; set; }
    public Guid ServiceRequestId { get; set; }
    public Guid FreelancerId { get; set; }
    public string FreelancerName { get; set; } = string.Empty;
    public string? FreelancerProfilePicture { get; set; }
    public double RatingAverage { get; set; }
    public int RatingCount { get; set; }
    public string? Bio { get; set; }
    public string Status { get; set; } = string.Empty;
    public string DisplayStatus { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
}
