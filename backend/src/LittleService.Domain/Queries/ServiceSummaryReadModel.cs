namespace LittleService.Domain.Queries;

public class ServiceSummaryReadModel
{
    public Guid Id { get; init; }
    public Guid FreelancerId { get; init; }
    public string Title { get; init; } = string.Empty;
    public string Description { get; init; } = string.Empty;
    public decimal Price { get; init; }
    public bool IsActive { get; init; }
    public DateTime CreatedAt { get; init; }
}
