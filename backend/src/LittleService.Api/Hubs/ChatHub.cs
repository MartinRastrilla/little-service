using System.Security.Claims;
using LittleService.Application.Interfaces.Services;
using LittleService.Api.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;

namespace LittleService.Api.Hubs;

[Authorize]
public class ChatHub : Hub
{
    private readonly IChatAuthorizationService _chatAuthorizationService;

    public ChatHub(IChatAuthorizationService chatAuthorizationService)
    {
        _chatAuthorizationService = chatAuthorizationService;
    }

    public async Task JoinThread(Guid serviceRequestId, Guid withUserId)
    {
        var userId = GetUserId();
        if (userId == null)
            throw new HubException("Unauthorized");

        var access = await _chatAuthorizationService.EvaluateAccessAsync(
            userId.Value,
            serviceRequestId,
            withUserId,
            Context.ConnectionAborted);

        if (!access.CanOpen)
            throw new HubException(access.BlockedReason ?? "No tenés permisos para unirte a este chat");

        var groupName = ChatThreadGroupName.ForThread(serviceRequestId, userId.Value, withUserId);
        await Groups.AddToGroupAsync(Context.ConnectionId, groupName);
    }

    public async Task LeaveThread(Guid serviceRequestId, Guid withUserId)
    {
        var userId = GetUserId();
        if (userId == null)
            return;

        var groupName = ChatThreadGroupName.ForThread(serviceRequestId, userId.Value, withUserId);
        await Groups.RemoveFromGroupAsync(Context.ConnectionId, groupName);
    }

    private Guid? GetUserId()
    {
        var claim = Context.User?.FindFirstValue(ClaimTypes.NameIdentifier);
        return Guid.TryParse(claim, out var id) ? id : null;
    }
}
