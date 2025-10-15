using LittleService.Application.DTOs;
using LittleService.Application.DTOs.Common;

namespace LittleService.Application.Interfaces.Roles;

public interface IRoleService
{
    Task<Result<IEnumerable<RoleDto>>> GetAllAsync();
    Task<Result<RoleDto>> GetByIdAsync(Guid id);
    Task<Result<RoleDto>> GetByNameAsync(string name);
    Task<Result<RoleDto>> CreateAsync(CreateRoleDto createRoleDto);
    Task<Result<RoleDto>> UpdateAsync(Guid id, UpdateRoleDto updateRoleDto);
    Task<Result<bool>> DeleteAsync(Guid id);
}