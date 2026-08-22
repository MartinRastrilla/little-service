using LittleService.Application.DTOs.Messages;

namespace LittleService.Application.Interfaces.Services;

public interface IChatEventPublisher
{
    Task PublishMessageReceivedAsync(MessageDto message, CancellationToken cancellationToken = default);
    Task PublishMessagesReadAsync(
        Guid serviceRequestId,
        Guid readByUserId,
        Guid withUserId,
        DateTime readAt,
        CancellationToken cancellationToken = default);
}
