using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerJobs;

public class GetFreelancerJobsResult
{
    public IList<FreelancerWorkItemSummaryDto> Items { get; set; } = new List<FreelancerWorkItemSummaryDto>();
}
