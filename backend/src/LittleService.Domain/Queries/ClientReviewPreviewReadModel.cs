namespace LittleService.Domain.Queries;

public class ClientReviewPreviewReadModel
{
    public Guid Id { get; init; }
    public string ReviewerName { get; init; } = string.Empty;
    public string? ReviewerProfilePictureUrl { get; init; }
    public int Rating { get; init; }
    public string? Comment { get; init; }
    public string ServiceRequestTitle { get; init; } = string.Empty;
    public DateTime CreatedAt { get; init; }
}
