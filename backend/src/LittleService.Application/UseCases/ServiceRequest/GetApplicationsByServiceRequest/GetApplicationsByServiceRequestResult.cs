using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetApplicationsByServiceRequest;

public class GetApplicationsByServiceRequestResult
{
    public IList<FreelancerApplicationSummaryDto> Applications { get; set; } = new List<FreelancerApplicationSummaryDto>();
    public bool CanManageApplications { get; set; }
    public string ServiceRequestTitle { get; set; } = string.Empty;
    public string ServiceRequestDisplayStatus { get; set; } = string.Empty;
}
