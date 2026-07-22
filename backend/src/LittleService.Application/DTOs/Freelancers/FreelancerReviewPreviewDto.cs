namespace LittleService.Application.DTOs.Freelancers;

public class FreelancerReviewPreviewDto
{
    public Guid Id { get; set; }
    public string ReviewerName { get; set; } = string.Empty;
    public string? ReviewerProfilePictureUrl { get; set; }
    public int Rating { get; set; }
    public string? Comment { get; set; }
    public string ServiceRequestTitle { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
}
