using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using Mediator;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerJobs;

public class GetFreelancerJobsQuery : IRequest<Result<GetFreelancerJobsResult>>
{
    public Guid UserId { get; set; }
    public string? Filter { get; set; }
}
