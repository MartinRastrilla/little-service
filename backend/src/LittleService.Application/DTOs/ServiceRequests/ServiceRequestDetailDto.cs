namespace LittleService.Application.DTOs.ServiceRequests;

public class ServiceRequestDetailDto
{
    public Guid Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Location { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public decimal? Price { get; set; }
    public Guid ClientId { get; set; }
    public Guid? FreelancerPickedId { get; set; }
    public int ApplicationsCount { get; set; }
    public IList<ServiceRequestPhotoDto> Photos { get; set; } = new List<ServiceRequestPhotoDto>();
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
