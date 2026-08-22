using System.Security.Claims;
using System.Text.Json;
using LittleService.Api.Models;
using LittleService.Application.Common;
using LittleService.Application.UseCases.ServiceRequest.AcceptApplication;
using LittleService.Application.UseCases.ServiceRequest.ApplyToServiceRequest;
using LittleService.Application.UseCases.ServiceRequest.CancelServiceRequest;
using LittleService.Application.UseCases.ServiceRequest.CancelServiceRequestEngagement;
using LittleService.Application.UseCases.ServiceRequest.CreateServiceRequest;
using LittleService.Application.UseCases.ServiceRequest.GetApplicationsByServiceRequest;
using LittleService.Application.UseCases.ServiceRequest.GetMyServiceRequests;
using LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequestDetail;
using LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequests;
using LittleService.Application.UseCases.ServiceRequest.GetServiceRequestById;
using LittleService.Application.UseCases.ServiceRequest.GetServiceRequestInfo;
using LittleService.Application.UseCases.ServiceRequest.GetServiceRequestProfessional;
using LittleService.Application.UseCases.ServiceRequest.GetServiceRequestActivity;
using LittleService.Application.UseCases.ServiceRequest.RejectApplication;
using LittleService.Application.UseCases.ServiceRequest.UpdateServiceRequest;
using LittleService.Application.UseCases.Message.GetChatAccess;
using LittleService.Application.UseCases.Message.GetConversation;
using LittleService.Application.UseCases.Message.GetServiceRequestConversations;
using LittleService.Application.UseCases.Message.MarkConversationAsRead;
using LittleService.Application.UseCases.Message.SendMessage;
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
    public async Task<IActionResult> Create([FromForm] CreateServiceRequestFormDto form, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var photos = new List<ServiceRequestPhotoUploadInput>();
        if (form.Photos != null)
        {
            foreach (var photo in form.Photos)
            {
                photos.Add(new ServiceRequestPhotoUploadInput
                {
                    Content = photo.OpenReadStream(),
                    FileName = photo.FileName,
                    ContentType = photo.ContentType,
                    Length = photo.Length
                });
            }
        }

        var command = new CreateServiceRequestCommand
        {
            UserId = userId.Value,
            Request = new CreateServiceRequestRequest
            {
                Title = form.Title,
                Description = form.Description,
                Location = form.Location,
                Price = form.Price,
                Photos = photos
            }
        };

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
    public async Task<IActionResult> GetMy(
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 20,
        [FromQuery] string? filter = null,
        [FromQuery] string? search = null,
        CancellationToken cancellationToken = default)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetMyServiceRequestsQuery
        {
            UserId = userId.Value,
            Page = page,
            PageSize = pageSize,
            Filter = filter,
            Search = search
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "INVALID_PAGE" or "INVALID_PAGE_SIZE" or "INVALID_FILTER" => BadRequest(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequests);
    }

    [HttpGet("open")]
    public async Task<IActionResult> GetOpen(
        [FromQuery] string? search = null,
        [FromQuery] string? filter = null,
        [FromQuery] int? timezoneOffsetMinutes = null,
        CancellationToken cancellationToken = default)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetOpenServiceRequestsQuery
        {
            UserId = userId.Value,
            Search = search,
            Filter = filter,
            TimezoneOffsetMinutes = timezoneOffsetMinutes
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "INVALID_FILTER" => BadRequest(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequests);
    }

    [HttpGet("{id:guid}/open-detail")]
    public async Task<IActionResult> GetOpenDetail(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetOpenServiceRequestDetailQuery
        {
            UserId = userId.Value,
            ServiceRequestId = id
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "FREELANCER_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequest);
    }

    [HttpGet("{id:guid}/info")]
    public async Task<IActionResult> GetInfo(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetServiceRequestInfoQuery { UserId = userId.Value, ServiceRequestId = id };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequest);
    }

    [HttpGet("{id:guid}/professional")]
    public async Task<IActionResult> GetProfessional(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetServiceRequestProfessionalQuery
        {
            UserId = userId.Value,
            ServiceRequestId = id
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Professional);
    }

    [HttpPost("{id:guid}/cancel-engagement")]
    public async Task<IActionResult> CancelEngagement(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new CancelServiceRequestEngagementCommand
        {
            UserId = userId.Value,
            ServiceRequestId = id
        };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" or
                "NO_ASSIGNED_PROFESSIONAL" or "ACCEPTED_APPLICATION_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                "ACTIVE_CONTRACT_BLOCKS_REVOKE_ENGAGEMENT" or "SERVICE_REQUEST_CANCELLED" or
                "APPLICATION_NOT_ACCEPTED" or "APPLICATION_FREELANCER_MISMATCH" or
                "SERVICE_REQUEST_MISMATCH" =>
                    BadRequest(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Professional);
    }

    [HttpGet("{id:guid}/activity")]
    public async Task<IActionResult> GetActivity(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetServiceRequestActivityQuery { UserId = userId.Value, ServiceRequestId = id };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Activity);
    }

    [HttpGet("{id:guid}/conversations")]
    public async Task<IActionResult> GetConversations(Guid id, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetServiceRequestConversationsQuery
        {
            UserId = userId.Value,
            ServiceRequestId = id
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Conversations);
    }

    [HttpGet("{id:guid}/messages")]
    public async Task<IActionResult> GetMessages(
        Guid id,
        [FromQuery] Guid withUserId,
        [FromQuery] DateTime? cursor,
        [FromQuery] int limit = 50,
        CancellationToken cancellationToken = default)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetConversationQuery
        {
            UserId = userId.Value,
            ServiceRequestId = id,
            WithUserId = withUserId,
            Cursor = cursor,
            Limit = limit
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "SERVICE_REQUEST_NOT_FOUND" or "USER_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" or "CHAT_NOT_ALLOWED" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Messages);
    }

    [HttpPost("{id:guid}/messages")]
    public async Task<IActionResult> SendMessage(
        Guid id,
        [FromBody] SendMessageRequestDto request,
        CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new SendMessageCommand
        {
            UserId = userId.Value,
            ServiceRequestId = id,
            ToUserId = request.ToUserId,
            Content = request.Content
        };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "SERVICE_REQUEST_NOT_FOUND" or "USER_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" or "CHAT_NOT_ALLOWED" => Forbid(),
                "WAITING_FOR_CLIENT_MESSAGE" or "SERVICE_REQUEST_READ_ONLY" or
                "APPLICATION_REJECTED_READ_ONLY" or "MESSAGE_CONTENT_EMPTY" or
                "MESSAGE_CONTENT_TOO_LONG" or "SELF_MESSAGE_NOT_ALLOWED" =>
                    BadRequest(new { message = result.Error, code = result.ErrorCode }),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return StatusCode(201, result.Value!.Message);
    }

    [HttpPost("{id:guid}/messages/read")]
    public async Task<IActionResult> MarkMessagesAsRead(
        Guid id,
        [FromBody] MarkConversationAsReadRequestDto request,
        CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var command = new MarkConversationAsReadCommand
        {
            UserId = userId.Value,
            ServiceRequestId = id,
            WithUserId = request.WithUserId
        };
        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "SERVICE_REQUEST_NOT_FOUND" or "USER_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" or "CHAT_NOT_ALLOWED" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value);
    }

    [HttpGet("{id:guid}/chat-access")]
    public async Task<IActionResult> GetChatAccess(
        Guid id,
        [FromQuery] Guid withUserId,
        CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var query = new GetChatAccessQuery
        {
            UserId = userId.Value,
            ServiceRequestId = id,
            WithUserId = withUserId
        };
        var result = await _mediator.Send(query, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "SERVICE_REQUEST_NOT_FOUND" or "USER_NOT_FOUND" =>
                    NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" or "CHAT_NOT_ALLOWED" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.Access);
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
    public async Task<IActionResult> Update(Guid id, [FromForm] UpdateServiceRequestFormDto form, CancellationToken cancellationToken)
    {
        var userId = GetUserId();
        if (userId == null) return Unauthorized();

        var deletedPhotoIds = ParseDeletedPhotoIds(form.DeletedPhotoIds);
        var photos = new List<ServiceRequestPhotoUploadInput>();
        if (form.Photos != null)
        {
            foreach (var photo in form.Photos)
            {
                photos.Add(new ServiceRequestPhotoUploadInput
                {
                    Content = photo.OpenReadStream(),
                    FileName = photo.FileName,
                    ContentType = photo.ContentType,
                    Length = photo.Length
                });
            }
        }

        var command = new UpdateServiceRequestCommand
        {
            UserId = userId.Value,
            ServiceRequestId = id,
            Request = new UpdateServiceRequestRequest
            {
                Title = form.Title,
                Description = form.Description,
                Location = form.Location,
                Price = form.Price,
                ClearPrice = form.ClearPrice,
                DeletedPhotoIds = deletedPhotoIds
            },
            NewPhotos = photos
        };

        var result = await _mediator.Send(command, cancellationToken);

        if (!result.IsSuccess)
        {
            return result.ErrorCode switch
            {
                "USER_NOT_FOUND" or "CLIENT_NOT_FOUND" or "SERVICE_REQUEST_NOT_FOUND" or "PHOTO_NOT_FOUND" => NotFound(new { message = result.Error, code = result.ErrorCode }),
                "FORBIDDEN" => Forbid(),
                _ => BadRequest(new { message = result.Error, code = result.ErrorCode })
            };
        }

        return Ok(result.Value!.ServiceRequest);
    }

    private static IList<Guid> ParseDeletedPhotoIds(string? deletedPhotoIdsJson)
    {
        if (string.IsNullOrWhiteSpace(deletedPhotoIdsJson))
            return new List<Guid>();

        try
        {
            return JsonSerializer.Deserialize<List<Guid>>(deletedPhotoIdsJson) ?? new List<Guid>();
        }
        catch (JsonException)
        {
            return deletedPhotoIdsJson
                .Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
                .Where(value => Guid.TryParse(value, out _))
                .Select(Guid.Parse)
                .ToList();
        }
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
                "ACTIVE_CONTRACT_BLOCKS_CANCEL" or "SERVICE_REQUEST_NOT_OPENED" => BadRequest(new { message = result.Error, code = result.ErrorCode }),
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

        return Ok(result.Value);
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
