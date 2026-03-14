using LittleService.Application.DTOs.Users;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerProfile;

public class GetFreelancerProfileResult
{
    public UserDto User { get; set; } = new UserDto();
}
