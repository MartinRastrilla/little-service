namespace LittleService.Application.DTOs.ServiceRequests;

public class FreelancerWorkItemSummaryDto
{
    public Guid Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Location { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public string DisplayStatus { get; set; } = string.Empty;
    public decimal? Price { get; set; }
    public string PriceMode { get; set; } = string.Empty;
    public int PhotosCount { get; set; }
    public int ApplicationsCount { get; set; }
    public string? CoverPhotoUrl { get; set; }
    public DateTime CreatedAt { get; set; }

    public Guid? ApplicationId { get; set; }
    public string? ApplicationStatus { get; set; }
    public DateTime? ApplicationCreatedAt { get; set; }
    public bool CanViewApplicationDetail { get; set; }

    public string? ClientName { get; set; }
    public decimal? ContractAmount { get; set; }
    public DateTime? ContractStartDate { get; set; }
    public bool HasContract { get; set; }
    public int UnreadMessagesCount { get; set; }
}
