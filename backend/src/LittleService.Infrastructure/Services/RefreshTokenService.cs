using System.Security.Cryptography;
using System.Text;
using LittleService.Application.Interfaces.Services;
using Microsoft.Extensions.Configuration;

namespace LittleService.Infrastructure.Services;

public class RefreshTokenService : IRefreshTokenService
{
    private readonly IConfiguration _configuration;

    public RefreshTokenService(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public string GenerateToken()
    {
        var bytes = RandomNumberGenerator.GetBytes(64);
        return Convert.ToBase64String(bytes)
            .TrimEnd('=')
            .Replace('+', '-')
            .Replace('/', '_');
    }

    public string HashToken(string token)
    {
        var hashBytes = SHA256.HashData(Encoding.UTF8.GetBytes(token));
        return Convert.ToHexString(hashBytes).ToLowerInvariant();
    }

    public DateTime GetExpirationDate()
    {
        var daysRaw = _configuration["Jwt:RefreshTokenDays"];
        var days = int.TryParse(daysRaw, out var parsedDays) ? parsedDays : 30;
        return DateTime.UtcNow.AddDays(days);
    }
}
