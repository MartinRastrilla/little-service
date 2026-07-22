using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Freelancer.GetPublicFreelancerProfile;

public class GetPublicFreelancerProfileQuery : IRequest<Result<GetPublicFreelancerProfileResult>>
{
    public Guid ViewerUserId { get; set; }
    public Guid FreelancerId { get; set; }
}
