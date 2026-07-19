namespace LittleService.Application.DTOs.ServiceRequests;

public class OpenServiceRequestDetailDto
{
    public Guid Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Location { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public string DisplayStatus { get; set; } = string.Empty;
    public decimal? Price { get; set; }
    public string PriceMode { get; set; } = string.Empty;
    public int PhotosCount { get; set; }
    public int ApplicationsCount { get; set; }
    public IList<ServiceRequestPhotoDto> Photos { get; set; } = new List<ServiceRequestPhotoDto>();
    public DateTime CreatedAt { get; set; }
    public bool CanApply { get; set; }
    public bool HasApplied { get; set; }
    public string? ApplicationStatus { get; set; }
    public Guid? ApplicationId { get; set; }
    public ClientSummaryDto Client { get; set; } = null!;
}
