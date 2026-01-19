using LittleService.Application.DTOs.Users;

namespace LittleService.Application.UseCases.Freelancer.UpdateFreelancer;

public class UpdateFreelancerResult
{
    public UserDto User { get; set; } = new UserDto();
}