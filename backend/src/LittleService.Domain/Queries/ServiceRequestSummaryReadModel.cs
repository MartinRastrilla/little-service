using LittleService.Domain.Entities.Enums;

namespace LittleService.Domain.Queries;

public class ServiceRequestSummaryReadModel
{
    public Guid Id { get; init; }
    public string Title { get; init; } = string.Empty;
    public string Description { get; init; } = string.Empty;
    public string Location { get; init; } = string.Empty;
    public ServiceRequestStatus Status { get; init; }
    public decimal? Price { get; init; }
    public Guid ClientId { get; init; }
    public Guid? FreelancerPickedId { get; init; }
    public int PhotosCount { get; init; }
    public DateTime CreatedAt { get; init; }
}
