using System.Security.Claims;
using LittleService.Application.DTOs.Contracts;
using LittleService.Application.UseCases.Contract.CancelPartialContract;
using LittleService.Application.UseCases.Contract.CreateContract;
using LittleService.Application.UseCases.Contract.GetContract;
using LittleService.Application.UseCases.Contract.SignContract;
using LittleService.Application.UseCases.Contract.UpdateContract;
using Mediator;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace LittleService.Api.Controllers;

[ApiController]
[Route("api/service-requests")]
[Authorize]
public class ContractController : ControllerBase
{
    private readonly IMediator _mediator;

    public ContractController(IMediator mediator)
    {
        _mediator = mediator;
    }

    private Guid? GetUserId()
    {
        var claim = User.FindFirstValue(ClaimTypes.NameIdentifier);
        return Guid.TryParse(claim, out var id) ? id : null;
    }

    [HttpPost("{id:guid}/contract")]
    public async Task<IActionResult> CreateContract(
        Guid id,
        [FromBody] UpsertContractRequest request,
        CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new CreateContractCommand
        {
            UserId = userId.Value,
            ServiceRequestId = id,
            Request = request
        };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
            return MapContractError(result.Error, result.ErrorCode);

        return CreatedAtAction(nameof(GetContract), new { id }, result.Value!.Contract);
    }

    [HttpGet("{id:guid}/contract")]
    public async Task<IActionResult> GetContract(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetContractQuery
        {
            UserId = userId.Value,
            ServiceRequestId = id
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
            return MapContractError(result.Error, result.ErrorCode);

        return Ok(result.Value!.Contract);
    }

    [HttpPut("{id:guid}/contract")]
    public async Task<IActionResult> UpdateContract(
        Guid id,
        [FromBody] UpsertContractRequest request,
        CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new UpdateContractCommand
        {
            UserId = userId.Value,
            ServiceRequestId = id,
            Request = request
        };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
            return MapContractError(result.Error, result.ErrorCode);

        return Ok(result.Value!.Contract);
    }

    [HttpPost("{id:guid}/contract/sign")]
    public async Task<IActionResult> SignContract(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new SignContractCommand
        {
            UserId = userId.Value,
            ServiceRequestId = id
        };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
            return MapContractError(result.Error, result.ErrorCode);

        return Ok(result.Value!.Contract);
    }

    [HttpDelete("{id:guid}/contract")]
    public async Task<IActionResult> CancelPartialContract(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new CancelPartialContractCommand
        {
            UserId = userId.Value,
            ServiceRequestId = id
        };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
            return MapContractError(result.Error, result.ErrorCode);

        return NoContent();
    }

    private IActionResult MapContractError(string? error, string? errorCode)
    {
        return errorCode switch
        {
            "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" or
            "NO_ASSIGNED_PROFESSIONAL" or "CONTRACT_NOT_FOUND" =>
                NotFound(new { message = error, code = errorCode }),
            "FORBIDDEN" => Forbid(),
            "CONTRACT_ALREADY_EXISTS" =>
                Conflict(new { message = error, code = errorCode }),
            "CONTRACT_NOT_PARTIALLY_SIGNED" =>
                BadRequest(new { message = error, code = errorCode }),
            _ => BadRequest(new { message = error, code = errorCode })
        };
    }
}
