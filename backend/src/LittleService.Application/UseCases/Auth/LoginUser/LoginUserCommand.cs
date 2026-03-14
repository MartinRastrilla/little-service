using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Auth.LoginUser;

public class LoginUserCommand : IRequest<Result<LoginUserResult>>
{
    public LoginUserRequest Request { get; set; } = null!;
}
