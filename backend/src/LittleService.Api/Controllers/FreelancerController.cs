using System.Security.Claims;
using LittleService.Application.UseCases.Freelancer.GetFreelancerApplications;
using LittleService.Application.UseCases.Freelancer.GetFreelancerJobs;
using Mediator;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace LittleService.Api.Controllers;

[ApiController]
[Route("api/freelancer")]
[Authorize]
public class FreelancerController : ControllerBase
{
    private readonly IMediator _mediator;

    public FreelancerController(IMediator mediator)
    {
        _mediator = mediator;
    }

    private Guid? GetUserId()
    {
        var claim = User.FindFirstValue(ClaimTypes.NameIdentifier);
        return Guid.TryParse(claim, out var id) ? id : null;
    }

    [HttpGet("applications")]
    public async Task<IActionResult> GetApplications(
        [FromQuery] string? status,
        CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetFreelancerApplicationsQuery
        {
            UserId = userId.Value,
            Status = status
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "INVALID_FILTER" => BadRequest(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Items);
    }

    [HttpGet("jobs")]
    public async Task<IActionResult> GetJobs(
        [FromQuery] string? filter,
        CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetFreelancerJobsQuery
        {
            UserId = userId.Value,
            Filter = filter
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "INVALID_FILTER" => BadRequest(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Items);
    }
}
