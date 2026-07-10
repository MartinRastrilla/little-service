using LittleService.Application.DTOs.Users;

namespace LittleService.Application.Services;

public class AuthTokensResult
{
    public string Token { get; set; } = string.Empty;
    public DateTime ExpiresAt { get; set; }
    public string RefreshToken { get; set; } = string.Empty;
    public DateTime RefreshTokenExpiresAt { get; set; }
    public UserDto User { get; set; } = new UserDto();
}
