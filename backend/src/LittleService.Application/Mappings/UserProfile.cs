using AutoMapper;
using LittleService.Application.DTOs.Users;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public class UserProfile : Profile
{
    public UserProfile()
    {
        // User -> UserDto
        CreateMap<User, UserDto>()
            .ForMember(dest => dest.Roles, opt => opt.MapFrom(src =>
                src.UserRoles.Select(ur => ur.Role)));

        // Role -> RoleDto
        CreateMap<Role, RoleDto>();

        // Freelancer -> FreelancerDto
        CreateMap<Freelancer, FreelancerDto>();

        // Client -> ClientDto
        CreateMap<Client, ClientDto>();
    }
}