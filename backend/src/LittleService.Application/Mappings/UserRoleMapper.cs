using LittleService.Application.DTOs;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public class UserRoleMapper
{
    public static UserRoleDto ToDto(UserRole userRole)
    {
        return new UserRoleDto
        {
            Id = userRole.Id,
            UserId = userRole.UserId,
            RoleId = userRole.RoleId,
        };
    }

    public static UserRole ToEntity(UserRoleDto userRoleDto)
    {
        return new UserRole
        {
            Id = userRoleDto.Id,
            UserId = userRoleDto.UserId,
            RoleId = userRoleDto.RoleId,
        };
    }
}