using LittleService.Application.DTOs;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public class RoleMapper
{
    public static RoleDto ToDto(Role role)
    {
        return new RoleDto
        {
            Id = role.Id,
            Name = role.Name,
            Description = role.Description,
        };
    }

    public static Role ToEntity(CreateRoleDto createRoleDto)
    {
        return new Role
        {
            Name = createRoleDto.Name,
            Description = createRoleDto.Description,
        };
    }

    public static void UpdateEntity(UpdateRoleDto updateRoleDto, Role role)
    {
        role.Name = updateRoleDto.Name;
        role.Description = updateRoleDto.Description;
    }
}