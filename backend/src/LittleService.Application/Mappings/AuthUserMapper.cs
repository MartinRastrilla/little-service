using LittleService.Application.DTOs.Users;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public static class AuthUserMapper
{
    public static UserDto ToUserDto(User user)
    {
        return new UserDto
        {
            Id = user.Id,
            Name = user.Name,
            Email = user.Email,
            ProfilePictureUrl = user.ProfilePictureUrl,
            CreatedAt = user.CreatedAt,
            UpdatedAt = user.UpdatedAt ?? user.CreatedAt,
            Roles = user.UserRoles.Select(ur => new RoleDto
            {
                Id = ur.Role.Id,
                Name = ur.Role.Name,
                Description = ur.Role.Description
            }).ToList(),
            Freelancer = user.Freelancer is null ? null : new FreelancerDto
            {
                UserId = user.Freelancer.Id,
                Bio = user.Freelancer.Bio,
                Profession = user.Freelancer.Profession,
                RatingAverage = user.Freelancer.RatingAverage,
                RatingCount = user.Freelancer.RatingCount,
                CompletedJobs = user.Freelancer.CompletedJobs
            },
            Client = user.Client is null ? null : new ClientDto
            {
                UserId = user.Client.Id,
                Address = user.Client.Address,
                TotalContracts = user.Client.TotalContracts
            }
        };
    }
}
