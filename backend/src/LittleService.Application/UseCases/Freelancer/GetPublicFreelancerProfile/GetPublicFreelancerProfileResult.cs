using LittleService.Application.DTOs.Freelancers;

namespace LittleService.Application.UseCases.Freelancer.GetPublicFreelancerProfile;

public class GetPublicFreelancerProfileResult
{
    public FreelancerPublicProfileDto Profile { get; set; } = new();
}
