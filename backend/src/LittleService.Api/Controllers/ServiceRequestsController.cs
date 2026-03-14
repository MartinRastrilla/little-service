using System.Security.Claims;
using LittleService.Application.UseCases.ServiceRequest.AcceptApplication;
using LittleService.Application.UseCases.ServiceRequest.ApplyToServiceRequest;
using LittleService.Application.UseCases.ServiceRequest.CancelServiceRequest;
using LittleService.Application.UseCases.ServiceRequest.CreateServiceRequest;
using LittleService.Application.UseCases.ServiceRequest.GetApplicationsByServiceRequest;
using LittleService.Application.UseCases.ServiceRequest.GetMyServiceRequests;
using LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequests;
using LittleService.Application.UseCases.ServiceRequest.GetServiceRequestById;
using LittleService.Application.UseCases.ServiceRequest.RejectApplication;
using LittleService.Application.UseCases.ServiceRequest.UpdateServiceRequest;
using Mediator;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/service-requests")]
[Authorize]
public class ServiceRequestsController : ControllerBase
{
    private readonly IMediator _mediator;

    public ServiceRequestsController(IMediator mediator)
    {
        _mediator = mediator;
    }

    private Guid? GetUserId()
    {
        var claim = User.FindFirstValue(ClaimTypes.NameIdentifier);
        return Guid.TryParse(claim, out var id) ? id : null;
    }

    // ─── Client endpoints ────────────────────────────────────────────────

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CreateServiceRequestRequest request, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new CreateServiceRequestCommand { UserId = userId.Value, Request = request };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return CreatedAtAction(nameof(GetById), new { id = result.Value!.ServiceRequest.Id }, result.Value.ServiceRequest);
    }

    [HttpGet("my")]
    public async Task<IActionResult> GetMy(CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetMyServiceRequestsQuery { UserId = userId.Value };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequests);
    }

    [HttpGet("open")]
    public async Task<IActionResult> GetOpen(CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetOpenServiceRequestsQuery { UserId = userId.Value };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequests);
    }

    [HttpGet("{id:guid}")]
    public async Task<IActionResult> GetById(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetServiceRequestByIdQuery { UserId = userId.Value, ServiceRequestId = id };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequest);
    }

    [HttpPut("{id:guid}")]
    public async Task<IActionResult> Update(Guid id, [FromBody] UpdateServiceRequestRequest request, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new UpdateServiceRequestCommand { UserId = userId.Value, ServiceRequestId = id, Request = request };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequest);
    }

    [HttpPost("{id:guid}/cancel")]
    public async Task<IActionResult> Cancel(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new CancelServiceRequestCommand { UserId = userId.Value, ServiceRequestId = id };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value);
    }

    [HttpGet("{id:guid}/applications")]
    public async Task<IActionResult> GetApplications(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetApplicationsByServiceRequestQuery { UserId = userId.Value, ServiceRequestId = id };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Applications);
    }

    [HttpPost("{id:guid}/applications/{applicationId:guid}/accept")]
    public async Task<IActionResult> AcceptApplication(Guid id, Guid applicationId, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new AcceptApplicationCommand { UserId = userId.Value, ServiceRequestId = id, ApplicationId = applicationId };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" or "APPLICATION_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Application);
    }

    [HttpPost("{id:guid}/applications/{applicationId:guid}/reject")]
    public async Task<IActionResult> RejectApplication(Guid id, Guid applicationId, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new RejectApplicationCommand { UserId = userId.Value, ServiceRequestId = id, ApplicationId = applicationId };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" or "APPLICATION_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Application);
    }

    // ─── Freelancer endpoints ─────────────────────────────────────────────

    [HttpPost("{id:guid}/apply")]
    public async Task<IActionResult> Apply(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new ApplyToServiceRequestCommand { UserId = userId.Value, ServiceRequestId = id };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "ALREADY_APPLIED" or "SERVICE_REQUEST_ALREADY_HAS_FREELANCER" or "FREELANCER_IS_CLIENT" => Conflict(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return StatusCode(201, result.Value!.Application);
    }
}
