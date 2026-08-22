namespace LittleService.Api.Helpers;

public static class ChatThreadGroupName
{
    public static string ForThread(Guid serviceRequestId, Guid userId1, Guid userId2)
    {
        var (minId, maxId) = userId1.CompareTo(userId2) <= 0
            ? (userId1, userId2)
            : (userId2, userId1);

        return $"thread:{serviceRequestId}:{minId}:{maxId}";
    }
}
