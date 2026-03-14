using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerProfile;

public class GetFreelancerProfileQuery : IRequest<Result<GetFreelancerProfileResult>>
{
    public Guid UserId { get; set; }
}
