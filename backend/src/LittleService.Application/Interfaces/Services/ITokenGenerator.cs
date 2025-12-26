using LittleService.Domain.Entities;

namespace LittleService.Application.Interfaces.Services;

public interface ITokenGenerator
{
    string GenerateToken(User user);
    DateTime GetTokenExpirationDate(string token);
}