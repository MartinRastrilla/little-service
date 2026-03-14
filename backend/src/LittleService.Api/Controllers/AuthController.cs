using LittleService.Application.DTOs.Auth;
using LittleService.Application.UseCases.Auth.LoginUser;
using LittleService.Application.UseCases.Auth.RegisterUser;
using Mediator;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IMediator _mediator;

    public AuthController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("register")]
    public async Task<ActionResult<AuthResponseDto>> Register([FromBody] RegisterDto registerDto, CancellationToken cancellationToken)
    {
        var command = new RegisterUserCommand
        {
            Request = new RegisterUserRequest
            {
                Name = registerDto.Name,
                Email = registerDto.Email,
                Password = registerDto.Password,
                ConfirmPassword = registerDto.ConfirmPassword,
                Roles = registerDto.Roles,
            }
        };

        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_ALREADY_EXISTS" => Conflict(new { message = result.Error, code = result.ErrorCode }),
                "PASSWORDS_DONT_MATCH" or "PASSWORD_EMPTY" or "PASSWORD_TOO_SHORT" or "PASSWORD_TOO_LONG"
                or "PASSWORD_NO_UPPERCASE" or "PASSWORD_NO_LOWERCASE" or "PASSWORD_NO_DIGIT"
                or "NO_ROLES_SPECIFIED" or "INVALID_ROLES" or "ROLES_NOT_FOUND"
                    => BadRequest(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        var response = new AuthResponseDto
        {
            Token = result.Value!.Token,
            ExpiresAt = result.Value!.ExpiresAt,
            User = result.Value!.User,
        };

        return Ok(response);
    }

    [HttpPost("login")]
    public async Task<ActionResult<AuthResponseDto>> Login([FromBody] LoginDto loginDto, CancellationToken cancellationToken)
    {
        var command = new LoginUserCommand
        {
            Request = new LoginUserRequest
            {
                Email = loginDto.Email,
                Password = loginDto.Password,
            }
        };

        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "INVALID_CREDENTIALS" or "USER_INACTIVE" => Unauthorized(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        var response = new AuthResponseDto
        {
            Token = result.Value!.Token,
            ExpiresAt = result.Value!.ExpiresAt,
            User = result.Value!.User,
        };

        return Ok(response);
    }
}
