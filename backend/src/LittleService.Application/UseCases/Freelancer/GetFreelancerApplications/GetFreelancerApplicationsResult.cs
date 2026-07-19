using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerApplications;

public class GetFreelancerApplicationsResult
{
    public IList<FreelancerWorkItemSummaryDto> Items { get; set; } = new List<FreelancerWorkItemSummaryDto>();
}
