using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Auth.LogoutUser;

public class LogoutUserCommand : IRequest<Result>
{
    public LogoutUserRequest Request { get; set; } = new();
}
