using LittleService.Domain.Entities.Enums;

namespace LittleService.Domain.Queries;

public class FreelancerWorkItemSummaryReadModel
{
    public Guid Id { get; init; }
    public string Title { get; init; } = string.Empty;
    public string Location { get; init; } = string.Empty;
    public ServiceRequestStatus Status { get; init; }
    public decimal? Price { get; init; }
    public int PhotosCount { get; init; }
    public int ApplicationsCount { get; init; }
    public string? CoverPhotoPath { get; init; }
    public DateTime CreatedAt { get; init; }
    public ContractStatus? ContractStatus { get; init; }

    public Guid? ApplicationId { get; init; }
    public FreelancerApplicationStatus? ApplicationStatus { get; init; }
    public DateTime? ApplicationCreatedAt { get; init; }

    public string? ClientName { get; init; }
    public decimal? ContractAmount { get; init; }
    public DateTime? ContractStartDate { get; init; }
    public bool HasContract { get; init; }
    public int UnreadMessagesCount { get; init; }
}
