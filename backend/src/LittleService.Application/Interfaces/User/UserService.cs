using LittleService.Application.DTOs;
using LittleService.Application.Mappings;
using LittleService.Infrastructure.Repositories;

namespace LittleService.Application.Interfaces;

public class UserService : IUserService
{
    private readonly IUserRepository _userRepository;

    public UserService(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    public async Task<IEnumerable<UserDto>> GetAllUsersAsync()
    {
        var users = await _userRepository.GetAllAsync();
        return users.Select(UserMapper.ToDto);
    }

    public async Task<UserDto?> GetUserByIdAsync(Guid id)
    {
        var user = await _userRepository.GetByIdAsync(id);
        return user is null ? null : UserMapper.ToDto(user);
    }

    public async Task<UserDto> CreateUserAsync(CreateUserDto createUserDto)
    {
        var user = UserMapper.ToEntityFromCreate(createUserDto);
        var created = await _userRepository.AddAsync(user);
        return UserMapper.ToDto(created);
    }

    public async Task<UserDto?> UpdateUserAsync(Guid id, UpdateUserDto updateUserDto)
    {
        var user = await _userRepository.GetByIdAsync(id);
        if (user is null)
        {
            return null;
        }
        UserMapper.UpdateEntity(updateUserDto, user);
        await _userRepository.UpdateAsync(user);
        return UserMapper.ToDto(user);
    }

    public async Task<bool> DeleteUserAsync(Guid id)
    {
        return await _userRepository.DeleteAsync(id);
    }
}