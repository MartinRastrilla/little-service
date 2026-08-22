using LittleService.Application.DTOs.Messages;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappers;

public static class MessageMapper
{
    public static MessageDto ToDto(Message message) =>
        new()
        {
            Id = message.Id,
            FromUserId = message.FromUserId,
            ToUserId = message.ToUserId,
            ServiceRequestId = message.ServiceRequestId,
            Content = message.Content,
            CreatedAt = message.CreatedAt,
            IsRead = message.IsRead
        };

    public static ChatAccessDto ToDto(ChatAccessResult access) =>
        new()
        {
            CanOpen = access.CanOpen,
            CanSend = access.CanSend,
            IsReadOnly = access.IsReadOnly,
            WaitingForClientMessage = access.WaitingForClientMessage,
            BlockedReason = access.BlockedReason
        };
}
