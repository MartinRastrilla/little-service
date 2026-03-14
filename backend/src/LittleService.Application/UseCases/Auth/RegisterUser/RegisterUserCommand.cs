using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Auth.RegisterUser;

public class RegisterUserCommand : IRequest<Result<RegisterUserResult>>
{
    public RegisterUserRequest Request { get; set; } = null!;
}
