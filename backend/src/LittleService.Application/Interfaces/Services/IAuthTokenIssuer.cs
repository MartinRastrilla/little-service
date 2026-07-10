using LittleService.Application.Services;
using LittleService.Domain.Entities;

namespace LittleService.Application.Interfaces.Services;

public interface IAuthTokenIssuer
{
    Task<AuthTokensResult> IssueAsync(
        User user,
        RefreshToken? tokenToRevoke = null,
        CancellationToken cancellationToken = default);
}
