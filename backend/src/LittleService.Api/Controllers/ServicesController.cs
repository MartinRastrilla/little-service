using System.Security.Claims;
using LittleService.Application.UseCases.Service.CreateService;
using LittleService.Application.UseCases.Service.DeleteService;
using LittleService.Application.UseCases.Service.GetMyServices;
using LittleService.Application.UseCases.Service.GetServiceById;
using LittleService.Application.UseCases.Service.UpdateService;
using Mediator;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class ServicesController : ControllerBase
{
    private readonly IMediator _mediator;

    public ServicesController(IMediator mediator)
    {
        _mediator = mediator;
    }

    private Guid? GetUserId()
    {
        var claim = User.FindFirstValue(ClaimTypes.NameIdentifier);
        return Guid.TryParse(claim, out var id) ? id : null;
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CreateServiceRequest request, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new CreateServiceCommand { UserId = userId.Value, Request = request };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return CreatedAtAction(nameof(GetById), new { id = result.Value!.Service.Id }, result.Value.Service);
    }

    [HttpGet("my")]
    public async Task<IActionResult> GetMy(CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetMyServicesQuery { UserId = userId.Value };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Services);
    }

    [HttpGet("{id:guid}")]
    public async Task<IActionResult> GetById(Guid id, CancellationToken cancellationToken)
    {
        var query = new GetServiceByIdQuery { ServiceId = id };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "SERVICE_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Service);
    }

    [HttpPut("{id:guid}")]
    public async Task<IActionResult> Update(Guid id, [FromBody] UpdateServiceRequest request, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new UpdateServiceCommand { UserId = userId.Value, ServiceId = id, Request = request };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" or "SERVICE_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Service);
    }

    [HttpDelete("{id:guid}")]
    public async Task<IActionResult> Delete(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new DeleteServiceCommand { UserId = userId.Value, ServiceId = id };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" or "SERVICE_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return NoContent();
    }
}
