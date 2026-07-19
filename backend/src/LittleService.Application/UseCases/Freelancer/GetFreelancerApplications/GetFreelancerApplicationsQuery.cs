using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using Mediator;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerApplications;

public class GetFreelancerApplicationsQuery : IRequest<Result<GetFreelancerApplicationsResult>>
{
    public Guid UserId { get; set; }
    public string? Status { get; set; }
}
