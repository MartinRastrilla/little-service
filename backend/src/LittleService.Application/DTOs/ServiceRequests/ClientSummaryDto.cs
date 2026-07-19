namespace LittleService.Application.DTOs.ServiceRequests;

public class ClientSummaryDto
{
    public Guid ClientId { get; set; }
    public string ClientName { get; set; } = string.Empty;
    public string? ClientProfilePictureUrl { get; set; }
    public string RatingLabel { get; set; } = string.Empty;
    public int PublishedJobsCount { get; set; }
}
