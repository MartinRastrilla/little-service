namespace LittleService.Application.UseCases.Auth.LoginUser;

public class LoginUserRequest
{
    public string Email { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
}
