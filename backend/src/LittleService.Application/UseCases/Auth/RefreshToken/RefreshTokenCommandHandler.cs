using LittleService.Application.Common;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Auth.RefreshToken;

public class RefreshTokenCommandHandler : IRequestHandler<RefreshTokenCommand, Result<RefreshTokenResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IRefreshTokenService _refreshTokenService;
    private readonly IAuthTokenIssuer _authTokenIssuer;
    private readonly ILogger<RefreshTokenCommandHandler> _logger;

    public RefreshTokenCommandHandler(
        IUnitOfWork unitOfWork,
        IRefreshTokenService refreshTokenService,
        IAuthTokenIssuer authTokenIssuer,
        ILogger<RefreshTokenCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _refreshTokenService = refreshTokenService;
        _authTokenIssuer = authTokenIssuer;
        _logger = logger;
    }

    public async ValueTask<Result<RefreshTokenResult>> Handle(
        RefreshTokenCommand command,
        CancellationToken cancellationToken)
    {
        try
        {
            var refreshToken = command.Request.RefreshToken?.Trim();
            if (string.IsNullOrWhiteSpace(refreshToken))
            {
                return Result<RefreshTokenResult>.Failure(
                    "Refresh token inválido",
                    "REFRESH_TOKEN_INVALID");
            }

            var tokenHash = _refreshTokenService.HashToken(refreshToken);
            var storedToken = await _unitOfWork.RefreshTokens.GetActiveByTokenHashAsync(
                tokenHash,
                cancellationToken);

            if (storedToken == null)
            {
                return Result<RefreshTokenResult>.Failure(
                    "Refresh token inválido",
                    "REFRESH_TOKEN_INVALID");
            }

            if (storedToken.RevokedAt.HasValue)
            {
                return Result<RefreshTokenResult>.Failure(
                    "Refresh token revocado",
                    "REFRESH_TOKEN_REVOKED");
            }

            if (storedToken.ExpiresAt <= DateTime.UtcNow)
            {
                return Result<RefreshTokenResult>.Failure(
                    "Refresh token expirado",
                    "REFRESH_TOKEN_EXPIRED");
            }

            if (!storedToken.User.IsUserActive())
            {
                return Result<RefreshTokenResult>.Failure(
                    "Tu cuenta ha sido desactivada. Por favor, contacta al soporte.",
                    "USER_INACTIVE");
            }

            var tokens = await _authTokenIssuer.IssueAsync(
                storedToken.User,
                storedToken,
                cancellationToken);

            return Result<RefreshTokenResult>.Success(new RefreshTokenResult
            {
                Token = tokens.Token,
                ExpiresAt = tokens.ExpiresAt,
                RefreshToken = tokens.RefreshToken,
                RefreshTokenExpiresAt = tokens.RefreshTokenExpiresAt,
                User = tokens.User
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Unexpected error during token refresh");
            return Result<RefreshTokenResult>.Failure(
                "Ocurrió un error al refrescar el token",
                "REFRESH_TOKEN_ERROR");
        }
    }
}
