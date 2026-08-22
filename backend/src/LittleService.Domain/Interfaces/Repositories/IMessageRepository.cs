using LittleService.Domain.Entities;
using LittleService.Domain.Queries;

namespace LittleService.Domain.Interfaces.Repositories;

public interface IMessageRepository
{
    //? CRUD Basic Methods
    Task<Message?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<Message> AddAsync(Message message, CancellationToken cancellationToken = default);
    Task UpdateAsync(Message message, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query for ServiceRequest (Chat)
    Task<IEnumerable<Message>> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Message>> GetByServiceRequestIdOrderedByDateAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);

    //? Query for User (Sender)
    Task<IEnumerable<Message>> GetByFromUserIdAsync(Guid fromUserId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Message>> GetUnreadByFromUserIdAsync(Guid fromUserId, CancellationToken cancellationToken = default);

    //? Query for User (Receiver)
    Task<IEnumerable<Message>> GetByToUserIdAsync(Guid toUserId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Message>> GetUnreadByToUserIdAsync(Guid toUserId, CancellationToken cancellationToken = default);

    //? Queries for status reading
    Task<IEnumerable<Message>> GetUnreadMessagesAsync(Guid userId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Message>> GetReadMessagesAsync(Guid userId, CancellationToken cancellationToken = default);

    //? Combined Queries
    Task<IEnumerable<Message>> GetConversationAsync(Guid serviceRequestId, Guid userId1, Guid userId2, CancellationToken cancellationToken = default);
    Task<MessagePageReadModel> GetConversationPageAsync(
        Guid serviceRequestId,
        Guid userId1,
        Guid userId2,
        DateTime? cursor,
        int limit = 50,
        CancellationToken cancellationToken = default);

    //? Queries for date range
    Task<IEnumerable<Message>> GetMessagesByDateRangeAsync(Guid serviceRequestId, DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default);

    //? Queries to mark as read
    Task<int> MarkAsReadByToUserIdAndServiceRequestIdAsync(Guid toUserId, Guid serviceRequestId, CancellationToken cancellationToken = default);
    Task<int> MarkConversationAsReadAsync(
        Guid toUserId,
        Guid fromUserId,
        Guid serviceRequestId,
        CancellationToken cancellationToken = default);
    Task<bool> MarkAsReadByIdAsync(Guid messageId, CancellationToken cancellationToken = default);

    //? Queries for count
    Task<int> GetUnreadCountByToUserIdAsync(Guid toUserId, CancellationToken cancellationToken = default);
    Task<int> GetUnreadCountByToUserIdAndServiceRequestIdAsync(Guid toUserId, Guid serviceRequestId, CancellationToken cancellationToken = default);
    Task<int> GetUnreadCountInConversationAsync(
        Guid toUserId,
        Guid fromUserId,
        Guid serviceRequestId,
        CancellationToken cancellationToken = default);

    //? Queries for validations
    Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default);
    Task<bool> HasClientInitiatedThreadAsync(
        Guid serviceRequestId,
        Guid clientUserId,
        Guid freelancerUserId,
        CancellationToken cancellationToken = default);

    Task<int> GetActiveConversationsCountByServiceRequestIdAsync(
        Guid serviceRequestId,
        Guid clientUserId,
        CancellationToken cancellationToken = default);

    Task<IReadOnlyList<ConversationSummaryReadModel>> GetInterlocutorsForServiceRequestAsync(
        Guid serviceRequestId,
        Guid userId,
        CancellationToken cancellationToken = default);

    Task<IReadOnlyList<InboxServiceRequestGroupReadModel>> GetInboxForUserAsync(
        Guid userId,
        CancellationToken cancellationToken = default);
}
