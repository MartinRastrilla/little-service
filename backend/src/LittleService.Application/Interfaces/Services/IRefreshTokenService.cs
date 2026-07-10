namespace LittleService.Application.Interfaces.Services;

public interface IRefreshTokenService
{
    string GenerateToken();
    string HashToken(string token);
    DateTime GetExpirationDate();
}
