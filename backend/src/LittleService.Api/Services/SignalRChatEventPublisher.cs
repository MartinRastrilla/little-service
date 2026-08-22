using LittleService.Application.DTOs.Messages;
using LittleService.Application.Interfaces.Services;
using LittleService.Api.Helpers;
using Microsoft.AspNetCore.SignalR;
using LittleService.Api.Hubs;

namespace LittleService.Api.Services;

public class SignalRChatEventPublisher : IChatEventPublisher
{
    private readonly IHubContext<ChatHub> _hubContext;

    public SignalRChatEventPublisher(IHubContext<ChatHub> hubContext)
    {
        _hubContext = hubContext;
    }

    public async Task PublishMessageReceivedAsync(MessageDto message, CancellationToken cancellationToken = default)
    {
        var groupName = ChatThreadGroupName.ForThread(
            message.ServiceRequestId,
            message.FromUserId,
            message.ToUserId);

        await _hubContext.Clients.Group(groupName)
            .SendAsync("MessageReceived", message, cancellationToken);
    }

    public async Task PublishMessagesReadAsync(
        Guid serviceRequestId,
        Guid readByUserId,
        Guid withUserId,
        DateTime readAt,
        CancellationToken cancellationToken = default)
    {
        var groupName = ChatThreadGroupName.ForThread(serviceRequestId, readByUserId, withUserId);
        var payload = new Models.MessagesReadEventDto
        {
            ServiceRequestId = serviceRequestId,
            ReadByUserId = readByUserId,
            WithUserId = withUserId,
            ReadAt = readAt
        };

        await _hubContext.Clients.Group(groupName)
            .SendAsync("MessagesRead", payload, cancellationToken);
    }
}
