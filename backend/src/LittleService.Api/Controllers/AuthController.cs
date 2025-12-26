using LittleService.Application.DTOs.Auth;
using LittleService.Application.UseCases.Auth.LoginUser;
using LittleService.Application.UseCases.Auth.RegisterUser;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly RegisterUserCommandHandler _registerUserHandler;
    private readonly LoginUserCommandHandler _loginUserHandler;

    public AuthController(RegisterUserCommandHandler registerUserHandler, LoginUserCommandHandler loginUserHandler)
    {
        _registerUserHandler = registerUserHandler;
        _loginUserHandler = loginUserHandler;
    }

    [HttpPost("register")]
    public async Task<ActionResult<AuthResponseDto>> Register([FromBody] RegisterDto registerDto)
    {
        var command = new RegisterUserCommand
        {
            Name = registerDto.Name,
            Email = registerDto.Email,
            Password = registerDto.Password,
            ConfirmPassword = registerDto.ConfirmPassword,
            Roles = registerDto.Roles,
        };

        var result = await _registerUserHandler.HandleAsync(command);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "PASSWORDS_DONT_MATCH" => BadRequest(new { message = result.Error }),
                "USER_ALREADY_EXISTS" => Conflict(new { message = result.Error }),
                "PASSWORD_EMPTY" or "PASSWORD_TOO_SHORT" or "PASSWORD_TOO_LONG"
                or "PASSWORD_NO_UPPERCASE" or "PASSWORD_NO_LOWERCASE" or "PASSWORD_NO_DIGIT"
                    => BadRequest(new { message = result.Error }),
                "NO_ROLES_SPECIFIED" or "INVALID_ROLES" or "ROLES_NOT_FOUND"
                    => BadRequest(new { message = result.Error }),
                _ => BadRequest(new { message = result.Error })
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
    public async Task<ActionResult<AuthResponseDto>> Login([FromBody] LoginDto loginDto)
    {
        var command = new LoginUserCommand
        {
            Email = loginDto.Email,
            Password = loginDto.Password,
        };

        var result = await _loginUserHandler.HandleAsync(command);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "INVALID_CREDENTIALS" => Unauthorized(new { message = result.Error }),
                "INVALID_PASSWORD" => Unauthorized(new { message = result.Error }),
                _ => BadRequest(new { message = result.Error })
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