namespace LittleService.Application.DTOs.Freelancers;

public class FreelancerPublicProfileDto
{
    public Guid FreelancerId { get; set; }
    public string FullName { get; set; } = string.Empty;
    public string? ProfilePictureUrl { get; set; }
    public string? Profession { get; set; }
    public string? Bio { get; set; }

    // TODO(tech-debt): freelancer verification
    public bool IsVerified { get; set; }

    public DateTime MemberSince { get; set; }
    public int YearsOnPlatform { get; set; }
    public double AverageRating { get; set; }
    public int TotalReviewsCount { get; set; }
    public int CompletedJobs { get; set; }
    public bool HasReports { get; set; }
    public IReadOnlyList<string> Skills { get; set; } = Array.Empty<string>();
    public int TotalActiveServicesCount { get; set; }
    public IReadOnlyList<FreelancerServicePreviewDto> OfferedServices { get; set; } =
        Array.Empty<FreelancerServicePreviewDto>();
    public IReadOnlyList<FreelancerReviewPreviewDto> RecentReviews { get; set; } =
        Array.Empty<FreelancerReviewPreviewDto>();
}
