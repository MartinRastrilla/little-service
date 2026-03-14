using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetApplicationsByServiceRequest;

public class GetApplicationsByServiceRequestResult
{
    public IList<FreelancerApplicationSummaryDto> Applications { get; set; } = new List<FreelancerApplicationSummaryDto>();
}
