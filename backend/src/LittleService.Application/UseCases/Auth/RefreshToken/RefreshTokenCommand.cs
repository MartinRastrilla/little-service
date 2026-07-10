using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Auth.RefreshToken;

public class RefreshTokenCommand : IRequest<Result<RefreshTokenResult>>
{
    public RefreshTokenRequest Request { get; set; } = new();
}
