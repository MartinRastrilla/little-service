using LittleService.Application.Common;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Auth.LogoutUser;

public class LogoutUserCommandHandler : IRequestHandler<LogoutUserCommand, Result>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IRefreshTokenService _refreshTokenService;
    private readonly ILogger<LogoutUserCommandHandler> _logger;

    public LogoutUserCommandHandler(
        IUnitOfWork unitOfWork,
        IRefreshTokenService refreshTokenService,
        ILogger<LogoutUserCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _refreshTokenService = refreshTokenService;
        _logger = logger;
    }

    public async ValueTask<Result> Handle(LogoutUserCommand command, CancellationToken cancellationToken)
    {
        try
        {
            var refreshToken = command.Request.RefreshToken?.Trim();
            if (string.IsNullOrWhiteSpace(refreshToken))
            {
                return Result.Success();
            }

            var tokenHash = _refreshTokenService.HashToken(refreshToken);
            var storedToken = await _unitOfWork.RefreshTokens.GetActiveByTokenHashAsync(
                tokenHash,
                cancellationToken);

            if (storedToken == null ||
                storedToken.RevokedAt.HasValue ||
                storedToken.ExpiresAt <= DateTime.UtcNow)
            {
                return Result.Success();
            }

            await _unitOfWork.RefreshTokens.RevokeAsync(storedToken, cancellationToken: cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result.Success();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Unexpected error during logout");
            return Result.Failure("Ocurrió un error al cerrar sesión", "LOGOUT_ERROR");
        }
    }
}
