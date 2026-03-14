using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.Freelancer.GetMyApplications;

public class GetMyApplicationsResult
{
    public IList<FreelancerApplicationSummaryDto> Applications { get; set; } = new List<FreelancerApplicationSummaryDto>();
}
