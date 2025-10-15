using LittleService.Application.DTOs;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public class UserMapper
{
    public static UserDto ToDto(User user)
    {
        var dto = new UserDto
        {
            Id = user.Id,
            Name = user.Name,
            Email = user.Email,
            CreatedAt = user.CreatedAt,
            UpdatedAt = user.UpdatedAt,
            Roles = user.UserRoles.Select(ur => new RoleDto
            {
                Id = ur.Role.Id,
                Name = ur.Role.Name,
                Description = ur.Role.Description
            }).ToList(),
        };

        if (user.Freelancer != null)
        {
            dto.Freelancer = FreelancerMapper.ToDto(user.Freelancer);
        }
        if (user.Client != null)
        {
            dto.Client = ClientMapper.ToDto(user.Client);
        }

        return dto;
    }

    public static User ToEntity(UserDto userDto)
    {
        return new User
        {
            Id = userDto.Id,
            Name = userDto.Name,
            Email = userDto.Email,
            CreatedAt = userDto.CreatedAt,
            UpdatedAt = userDto.UpdatedAt,
            UserRoles = new List<UserRole>(),
        };
    }

    public static User ToEntityFromCreate(CreateUserDto createUserDto)
    {
        return new User
        {
            Id = Guid.NewGuid(),
            Name = createUserDto.Name,
            Email = createUserDto.Email,
            Password = createUserDto.Password, //? Should be hashed
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow,
            UserRoles = new List<UserRole>(),
        };
    }

    public static void UpdateEntity(UpdateUserDto updateUserDto, User user)
    {
        bool hasChanges = false;
        if (updateUserDto.Name != user.Name)
        {
            user.Name = updateUserDto.Name;
            hasChanges = true;
        }
        if (updateUserDto.Email != user.Email)
        {
            user.Email = updateUserDto.Email;
            hasChanges = true;
        }
        if (hasChanges)
        {
            user.UpdatedAt = DateTime.UtcNow;
        }

        if (hasChanges)
        {
            user.UpdatedAt = DateTime.UtcNow;
        }
    }
}