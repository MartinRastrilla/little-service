using LittleService.Domain.Entities.Enums;

namespace LittleService.Domain.Queries;

public class FreelancerApplicationSummaryReadModel
{
    public Guid Id { get; init; }
    public Guid ServiceRequestId { get; init; }
    public Guid FreelancerId { get; init; }
    public string FreelancerName { get; init; } = string.Empty;
    public string? FreelancerProfilePicture { get; init; }
    public double RatingAverage { get; init; }
    public int RatingCount { get; init; }
    public string? Bio { get; init; }
    public FreelancerApplicationStatus Status { get; init; }
    public DateTime CreatedAt { get; init; }
}
