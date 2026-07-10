namespace LittleService.Application.UseCases.Auth.LogoutUser;

public class LogoutUserRequest
{
    public string RefreshToken { get; set; } = string.Empty;
}
