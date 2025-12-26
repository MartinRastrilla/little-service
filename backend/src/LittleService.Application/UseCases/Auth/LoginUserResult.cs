using LittleService.Application.DTOs.Users;

namespace LittleService.Application.UseCases.Auth.LoginUser;

public class LoginUserResult
{
    public string Token { get; set; } = string.Empty;
    public DateTime ExpiresAt { get; set; }
    public UserDto User { get; set; } = new UserDto();
}