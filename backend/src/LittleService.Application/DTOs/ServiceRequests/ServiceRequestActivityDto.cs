namespace LittleService.Application.DTOs.ServiceRequests;

public class ServiceRequestActivityDto
{
    public int MessagesCount { get; set; }
    public int ApplicationsCount { get; set; }
    public bool ShowRecentApplications { get; set; }
    public IList<ServiceRequestTimelineStepDto> Timeline { get; set; } = new List<ServiceRequestTimelineStepDto>();
    public IList<FreelancerApplicationSummaryDto> RecentApplications { get; set; } = new List<FreelancerApplicationSummaryDto>();
}
