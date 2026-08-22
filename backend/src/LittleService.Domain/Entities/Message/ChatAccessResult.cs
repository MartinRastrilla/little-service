namespace LittleService.Domain.Entities;

public class ChatAccessResult
{
    public bool CanOpen { get; init; }
    public bool CanSend { get; init; }
    public bool IsReadOnly { get; init; }
    public bool WaitingForClientMessage { get; init; }
    public string? BlockedReason { get; init; }
    public string? ErrorCode { get; init; }

    public static ChatAccessResult Denied(string blockedReason, string errorCode) =>
        new()
        {
            CanOpen = false,
            CanSend = false,
            IsReadOnly = false,
            WaitingForClientMessage = false,
            BlockedReason = blockedReason,
            ErrorCode = errorCode
        };

    public static ChatAccessResult Allowed(
        bool canSend,
        bool isReadOnly,
        bool waitingForClientMessage,
        string? blockedReason = null,
        string? errorCode = null) =>
        new()
        {
            CanOpen = true,
            CanSend = canSend,
            IsReadOnly = isReadOnly,
            WaitingForClientMessage = waitingForClientMessage,
            BlockedReason = blockedReason,
            ErrorCode = errorCode
        };
}
