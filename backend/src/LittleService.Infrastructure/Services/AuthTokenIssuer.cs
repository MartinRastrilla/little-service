using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappings;
using LittleService.Application.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;

namespace LittleService.Infrastructure.Services;

public class AuthTokenIssuer : IAuthTokenIssuer
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ITokenGenerator _tokenGenerator;
    private readonly IRefreshTokenService _refreshTokenService;

    public AuthTokenIssuer(
        IUnitOfWork unitOfWork,
        ITokenGenerator tokenGenerator,
        IRefreshTokenService refreshTokenService)
    {
        _unitOfWork = unitOfWork;
        _tokenGenerator = tokenGenerator;
        _refreshTokenService = refreshTokenService;
    }

    public async Task<AuthTokensResult> IssueAsync(
        User user,
        RefreshToken? tokenToRevoke = null,
        CancellationToken cancellationToken = default)
    {
        var plainRefreshToken = _refreshTokenService.GenerateToken();
        var refreshTokenHash = _refreshTokenService.HashToken(plainRefreshToken);
        var refreshTokenExpiresAt = _refreshTokenService.GetExpirationDate();

        var refreshTokenEntity = new RefreshToken
        {
            Id = Guid.NewGuid(),
            UserId = user.Id,
            TokenHash = refreshTokenHash,
            ExpiresAt = refreshTokenExpiresAt,
            CreatedAt = DateTime.UtcNow
        };

        await _unitOfWork.RefreshTokens.AddAsync(refreshTokenEntity, cancellationToken);

        if (tokenToRevoke != null)
        {
            await _unitOfWork.RefreshTokens.RevokeAsync(
                tokenToRevoke,
                refreshTokenEntity.Id,
                cancellationToken);
        }

        await _unitOfWork.SaveChangesAsync(cancellationToken);

        var accessToken = _tokenGenerator.GenerateToken(user);
        var accessTokenExpiresAt = _tokenGenerator.GetTokenExpirationDate(accessToken);

        return new AuthTokensResult
        {
            Token = accessToken,
            ExpiresAt = accessTokenExpiresAt,
            RefreshToken = plainRefreshToken,
            RefreshTokenExpiresAt = refreshTokenExpiresAt,
            User = AuthUserMapper.ToUserDto(user)
        };
    }
}
