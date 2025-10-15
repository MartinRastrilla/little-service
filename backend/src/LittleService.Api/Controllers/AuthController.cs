using LittleService.Application.DTOs;
using LittleService.Application.DTOs.Common;
using LittleService.Application.Interfaces;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IAuthService _authService;

    public AuthController(IAuthService authService)
    {
        _authService = authService;
    }

    [HttpPost("login")]
    public async Task<ActionResult<AuthResponseDto>> Login([FromBody] LoginDto loginDto)
    {
        var result = await _authService.LoginAsync(loginDto);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "INVALID_CREDENTIALS" => Unauthorized(new { message = result.Error }),
                _ => BadRequest(new { message = result.Error })
            };
        }

        return Ok(result.Value);
    }

    [HttpPost("register")]
    public async Task<ActionResult<AuthResponseDto>> Register([FromBody] RegisterDto registerDto)
    {
        var result = await _authService.RegisterAsync(registerDto);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "PASSWORDS_DONT_MATCH" => BadRequest(new { message = result.Error }),
                "USER_ALREADY_EXISTS" => Conflict(new { message = result.Error }),
                "PASSWORD_EMPTY" or "PASSWORD_TOO_SHORT" or "PASSWORD_TOO_LONG"
                or "PASSWORD_NO_UPPERCASE" or "PASSWORD_NO_LOWERCASE" or "PASSWORD_NO_DIGIT"
                    => BadRequest(new { message = result.Error }),
                _ => BadRequest(new { message = result.Error })
            };
        }

        return Ok(result.Value);
    }

    [HttpPost("validate")]
    public async Task<ActionResult<bool>> Validate([FromBody] LoginDto loginDto)
    {
        var result = await _authService.ValidateUserAsync(loginDto.Email, loginDto.Password);

        if (!result.IsSuccess)
        {
            return BadRequest(new { message = result.Error });
        }

        return Ok(new { isValid = result.Value });
    }
}