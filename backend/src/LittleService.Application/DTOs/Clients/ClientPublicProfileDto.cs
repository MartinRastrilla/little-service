namespace LittleService.Application.DTOs.Clients;

public class ClientPublicProfileDto
{
    public Guid ClientId { get; set; }
    public string FullName { get; set; } = string.Empty;
    public string? ProfilePictureUrl { get; set; }

    // TODO(tech-debt): account verification
    public bool IsVerified { get; set; }

    // TODO(tech-debt): email verification
    public bool IsEmailVerified { get; set; }

    public DateTime MemberSince { get; set; }
    public double AverageRating { get; set; }
    public int TotalReviewsCount { get; set; }
    public int PublishedJobsCount { get; set; }
    public string? Location { get; set; }
    public bool HasReports { get; set; }
    public IReadOnlyList<ClientReviewPreviewDto> RecentReviews { get; set; } = Array.Empty<ClientReviewPreviewDto>();
}
