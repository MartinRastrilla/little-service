using LittleService.Application.DTOs;
using LittleService.Application.DTOs.Common;
using LittleService.Application.Mappings;
using LittleService.Infrastructure.Repositories.Roles;

namespace LittleService.Application.Interfaces.Roles;

public class RoleService : IRoleService
{
    private readonly IRoleRepository _roleRepository;

    public RoleService(IRoleRepository roleRepository)
    {
        _roleRepository = roleRepository;
    }

    public async Task<Result<IEnumerable<RoleDto>>> GetAllAsync()
    {
        var roles = await _roleRepository.GetAllAsync();
        if (roles is null)
            return Result<IEnumerable<RoleDto>>.Failure("No se encontraron roles", "ROLES_NOT_FOUND");
        return Result<IEnumerable<RoleDto>>.Success(roles.Select(RoleMapper.ToDto));
    }

    public async Task<Result<RoleDto>> GetByIdAsync(Guid id)
    {
        var role = await _roleRepository.GetByIdAsync(id);
        if (role is null)
            return Result<RoleDto>.Failure("El rol no existe", "ROLE_NOT_FOUND");
        return Result<RoleDto>.Success(RoleMapper.ToDto(role));
    }

    public async Task<Result<RoleDto>> GetByNameAsync(string name)
    {
        var roleValidation = ValidateRoleOnRegister(name);
        if (!roleValidation.IsSuccess)
            return Result<RoleDto>.Failure(roleValidation.Error!, roleValidation.ErrorCode);
        var role = await _roleRepository.GetByNameAsync(name);
        if (role is null)
            return Result<RoleDto>.Failure("El rol no existe", "ROLE_NOT_FOUND");
        return Result<RoleDto>.Success(RoleMapper.ToDto(role));
    }

    public async Task<Result<RoleDto>> CreateAsync(CreateRoleDto createRoleDto)
    {
        var role = RoleMapper.ToEntity(createRoleDto);
        var createdRole = await _roleRepository.AddAsync(role);
        return Result<RoleDto>.Success(RoleMapper.ToDto(createdRole));
    }

    public async Task<Result<RoleDto>> UpdateAsync(Guid id, UpdateRoleDto updateRoleDto)
    {
        var role = await _roleRepository.GetByIdAsync(id);
        if (role is null)
            return Result<RoleDto>.Failure("El rol no existe", "ROLE_NOT_FOUND");
        RoleMapper.UpdateEntity(updateRoleDto, role);
        await _roleRepository.UpdateAsync(role);
        return Result<RoleDto>.Success(RoleMapper.ToDto(role));
    }


    public async Task<Result<bool>> DeleteAsync(Guid id)
    {
        var role = await _roleRepository.GetByIdAsync(id);
        if (role is null)
            return Result<bool>.Failure("El rol no existe", "ROLE_NOT_FOUND");
        await _roleRepository.DeleteAsync(id);
        return Result<bool>.Success(true);
    }

    private static Result ValidateRoleOnRegister(string role)
    {
        if (string.IsNullOrWhiteSpace(role))
            return Result.Failure("El rol no puede estar vacío", "ROLE_EMPTY");

        if (role != "Freelancer" && role != "Client")
            return Result.Failure("El rol no es válido", "ROLE_INVALID");


        return Result.Success();
    }
}