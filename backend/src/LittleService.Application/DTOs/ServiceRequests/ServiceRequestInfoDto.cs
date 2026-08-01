namespace LittleService.Application.DTOs.ServiceRequests;

public class ServiceRequestInfoDto
{
    public Guid Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Location { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public string DisplayStatus { get; set; } = string.Empty;
    public string? ContractStatus { get; set; }
    public decimal? Price { get; set; }
    public string PriceMode { get; set; } = string.Empty;
    public bool IsEditable { get; set; }
    public bool CanCancel { get; set; }
    public string? CancelBlockedReason { get; set; }
    public string? EditBlockedReason { get; set; }
    public int MessagesCount { get; set; }
    public int ApplicationsCount { get; set; }
    public IList<ServiceRequestPhotoDto> Photos { get; set; } = new List<ServiceRequestPhotoDto>();
    public DateTime CreatedAt { get; set; }
}
