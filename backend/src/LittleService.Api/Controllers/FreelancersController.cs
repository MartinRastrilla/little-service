using System.Security.Claims;
using LittleService.Api.Models;
using LittleService.Application.UseCases.Freelancer.GetFreelancerProfile;
using LittleService.Application.UseCases.Freelancer.GetMyApplications;
using LittleService.Application.UseCases.Freelancer.UpdateFreelancer;
using Mediator;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class FreelancersController : ControllerBase
{
    private readonly IMediator _mediator;

    public FreelancersController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet("me")]
    public async Task<IActionResult> GetProfile(CancellationToken cancellationToken)
    {
        var userIdClaim = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (string.IsNullOrEmpty(userIdClaim) || !Guid.TryParse(userIdClaim, out var userId))
            return Unauthorized();

        var query = new GetFreelancerProfileQuery { UserId = userId };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.User);
    }

    [HttpPut("me")]
    public async Task<IActionResult> UpdateProfile([FromForm] UpdateFreelancerProfileFormDto form, CancellationToken cancellationToken)
    {
        var userIdClaim = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (string.IsNullOrEmpty(userIdClaim) || !Guid.TryParse(userIdClaim, out var userId))
            return Unauthorized();

        Stream? stream = null;
        string? fileName = null;
        if (form.ProfilePicture != null)
        {
            stream = form.ProfilePicture.OpenReadStream();
            fileName = form.ProfilePicture.FileName;
        }

        var command = new UpdateFreelancerCommand
        {
            UserId = userId,
            Request = new UpdateFreelancerRequest
            {
                Name = form.Name,
                Bio = form.Bio,
                Profession = form.Profession,
                ProfilePicture = stream,
                ProfilePictureFileName = fileName,
            }
        };

        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "PROFILE_PICTURE_UPLOAD_ERROR" or "UPDATE_FREELANCER_ERROR" => BadRequest(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value);
    }

    [HttpGet("me/applications")]
    public async Task<IActionResult> GetMyApplications(CancellationToken cancellationToken)
    {
        var userIdClaim = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (string.IsNullOrEmpty(userIdClaim) || !Guid.TryParse(userIdClaim, out var userId))
            return Unauthorized();

        var query = new GetMyApplicationsQuery { UserId = userId };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Applications);
    }
}
