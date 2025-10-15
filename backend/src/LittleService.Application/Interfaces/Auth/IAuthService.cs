using LittleService.Application.DTOs;
using LittleService.Application.DTOs.Common;
using LittleService.Domain.Entities;

namespace LittleService.Application.Interfaces;

public interface IAuthService
{
    Task<Result<AuthResponseDto>> RegisterAsync(RegisterDto registerDto);
    Task<Result<AuthResponseDto>> LoginAsync(LoginDto loginDto);
    Task<Result<bool>> ValidateUserAsync(string email, string password);
    string GenerateJwtToken(User user);
}
