using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;
using LittleService.Domain.Queries;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class MessageRepository : IMessageRepository
{
    private readonly AppDbContext _context;

    public MessageRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<Message?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(m => m.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .FirstOrDefaultAsync(m => m.Id == id, cancellationToken);
    }

    public async Task<Message> AddAsync(Message message, CancellationToken cancellationToken = default)
    {
        await _context.Messages.AddAsync(message, cancellationToken);
        return message;
    }

    public async Task UpdateAsync(Message message, CancellationToken cancellationToken = default)
    {
        _context.Messages.Update(message);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var message = await GetByIdAsync(id, cancellationToken);
        if (message == null) return false;
        _context.Messages.Remove(message);
        return true;
    }

    public async Task<IEnumerable<Message>> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.ServiceRequestId == serviceRequestId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Message>> GetByServiceRequestIdOrderedByDateAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.ServiceRequestId == serviceRequestId)
            .OrderBy(m => m.CreatedAt)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Message>> GetByFromUserIdAsync(Guid fromUserId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.FromUserId == fromUserId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Message>> GetUnreadByFromUserIdAsync(Guid fromUserId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.FromUserId == fromUserId && !m.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Message>> GetByToUserIdAsync(Guid toUserId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.ToUserId == toUserId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Message>> GetUnreadByToUserIdAsync(Guid toUserId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.ToUserId == toUserId && !m.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Message>> GetUnreadMessagesAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.ToUserId == userId && !m.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Message>> GetReadMessagesAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.ToUserId == userId && m.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Message>> GetConversationAsync(
        Guid serviceRequestId,
        Guid userId1,
        Guid userId2,
        CancellationToken cancellationToken = default)
    {
        return await ConversationQuery(serviceRequestId, userId1, userId2)
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .OrderBy(m => m.CreatedAt)
            .ToListAsync(cancellationToken);
    }

    public async Task<MessagePageReadModel> GetConversationPageAsync(
        Guid serviceRequestId,
        Guid userId1,
        Guid userId2,
        DateTime? cursor,
        int limit = 50,
        CancellationToken cancellationToken = default)
    {
        var query = ConversationQuery(serviceRequestId, userId1, userId2);

        if (cursor.HasValue)
            query = query.Where(m => m.CreatedAt < cursor.Value);

        var batch = await query
            .OrderByDescending(m => m.CreatedAt)
            .Take(limit + 1)
            .ToListAsync(cancellationToken);

        var hasMore = batch.Count > limit;
        if (hasMore)
            batch = batch.Take(limit).ToList();

        batch.Reverse();

        DateTime? nextCursor = hasMore && batch.Count > 0 ? batch[0].CreatedAt : null;

        return new MessagePageReadModel
        {
            Items = batch,
            NextCursor = nextCursor,
            HasMore = hasMore
        };
    }

    public async Task<IEnumerable<Message>> GetMessagesByDateRangeAsync(
        Guid serviceRequestId,
        DateTime startDate,
        DateTime endDate,
        CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .Where(m => m.ServiceRequestId == serviceRequestId && m.CreatedAt >= startDate && m.CreatedAt <= endDate)
            .ToListAsync(cancellationToken);
    }

    public async Task<int> MarkAsReadByToUserIdAndServiceRequestIdAsync(
        Guid toUserId,
        Guid serviceRequestId,
        CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Where(m => m.ToUserId == toUserId && m.ServiceRequestId == serviceRequestId && !m.IsRead)
            .ExecuteUpdateAsync(m => m.SetProperty(x => x.IsRead, true), cancellationToken);
    }

    public async Task<int> MarkConversationAsReadAsync(
        Guid toUserId,
        Guid fromUserId,
        Guid serviceRequestId,
        CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Where(m =>
                m.ToUserId == toUserId &&
                m.FromUserId == fromUserId &&
                m.ServiceRequestId == serviceRequestId &&
                !m.IsRead)
            .ExecuteUpdateAsync(m => m.SetProperty(x => x.IsRead, true), cancellationToken);
    }

    public async Task<bool> MarkAsReadByIdAsync(Guid messageId, CancellationToken cancellationToken = default)
    {
        var message = await GetByIdAsync(messageId, cancellationToken);
        if (message == null) return false;
        message.IsRead = true;
        await UpdateAsync(message, cancellationToken);
        return true;
    }

    public async Task<int> GetUnreadCountByToUserIdAsync(Guid toUserId, CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Where(m => m.ToUserId == toUserId && !m.IsRead)
            .CountAsync(cancellationToken);
    }

    public async Task<int> GetUnreadCountByToUserIdAndServiceRequestIdAsync(
        Guid toUserId,
        Guid serviceRequestId,
        CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Where(m => m.ToUserId == toUserId && m.ServiceRequestId == serviceRequestId && !m.IsRead)
            .CountAsync(cancellationToken);
    }

    public async Task<int> GetUnreadCountInConversationAsync(
        Guid toUserId,
        Guid fromUserId,
        Guid serviceRequestId,
        CancellationToken cancellationToken = default)
    {
        return await _context.Messages
            .Where(m =>
                m.ToUserId == toUserId &&
                m.FromUserId == fromUserId &&
                m.ServiceRequestId == serviceRequestId &&
                !m.IsRead)
            .CountAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Messages.AnyAsync(m => m.Id == id, cancellationToken);
    }

    public async Task<bool> HasClientInitiatedThreadAsync(
        Guid serviceRequestId,
        Guid clientUserId,
        Guid freelancerUserId,
        CancellationToken cancellationToken = default)
    {
        return await _context.Messages.AnyAsync(
            m => m.ServiceRequestId == serviceRequestId &&
                 m.FromUserId == clientUserId &&
                 m.ToUserId == freelancerUserId,
            cancellationToken);
    }

    public async Task<int> GetActiveConversationsCountByServiceRequestIdAsync(
        Guid serviceRequestId,
        Guid clientUserId,
        CancellationToken cancellationToken = default)
    {
        var messages = await _context.Messages
            .Where(m => m.ServiceRequestId == serviceRequestId)
            .Select(m => new { m.FromUserId, m.ToUserId })
            .ToListAsync(cancellationToken);

        var interlocutorIds = messages
            .Select(m => m.FromUserId == clientUserId ? m.ToUserId : m.FromUserId)
            .Where(userId => userId != clientUserId)
            .Distinct();

        return interlocutorIds.Count();
    }

    public async Task<IReadOnlyList<ConversationSummaryReadModel>> GetInterlocutorsForServiceRequestAsync(
        Guid serviceRequestId,
        Guid userId,
        CancellationToken cancellationToken = default)
    {
        var messages = await _context.Messages
            .Where(m => m.ServiceRequestId == serviceRequestId &&
                        (m.FromUserId == userId || m.ToUserId == userId))
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .OrderByDescending(m => m.CreatedAt)
            .ToListAsync(cancellationToken);

        return BuildConversationSummaries(messages, userId, serviceRequestId);
    }

    public async Task<IReadOnlyList<InboxServiceRequestGroupReadModel>> GetInboxForUserAsync(
        Guid userId,
        CancellationToken cancellationToken = default)
    {
        var messages = await _context.Messages
            .Where(m => m.FromUserId == userId || m.ToUserId == userId)
            .Include(m => m.FromUser)
            .Include(m => m.ToUser)
            .Include(m => m.ServiceRequest)
            .OrderByDescending(m => m.CreatedAt)
            .ToListAsync(cancellationToken);

        var grouped = messages
            .GroupBy(m => m.ServiceRequestId)
            .Select(g =>
            {
                var serviceRequest = g.First().ServiceRequest;
                var conversations = BuildConversationSummaries(g.ToList(), userId, g.Key);

                return new InboxServiceRequestGroupReadModel
                {
                    ServiceRequestId = g.Key,
                    Title = serviceRequest.Title,
                    Status = serviceRequest.Status,
                    Conversations = conversations
                };
            })
            .OrderByDescending(g => g.Conversations
                .Select(c => c.LastMessageAt ?? DateTime.MinValue)
                .DefaultIfEmpty(DateTime.MinValue)
                .Max())
            .ToList();

        return grouped;
    }

    private static IReadOnlyList<ConversationSummaryReadModel> BuildConversationSummaries(
        List<Message> messages,
        Guid userId,
        Guid serviceRequestId)
    {
        return messages
            .GroupBy(m => m.FromUserId == userId ? m.ToUserId : m.FromUserId)
            .Select(g =>
            {
                var withUserId = g.Key;
                var latest = g.OrderByDescending(m => m.CreatedAt).First();
                var interlocutor = latest.FromUserId == userId ? latest.ToUser : latest.FromUser;
                var unreadCount = g.Count(m => m.ToUserId == userId && !m.IsRead);

                return new ConversationSummaryReadModel
                {
                    ServiceRequestId = serviceRequestId,
                    WithUserId = withUserId,
                    WithUserName = interlocutor?.Name ?? string.Empty,
                    WithUserProfilePicture = interlocutor?.ProfilePictureUrl,
                    LastMessageContent = latest.Content,
                    LastMessageAt = latest.CreatedAt,
                    UnreadCount = unreadCount
                };
            })
            .OrderByDescending(c => c.LastMessageAt ?? DateTime.MinValue)
            .ToList();
    }

    private IQueryable<Message> ConversationQuery(Guid serviceRequestId, Guid userId1, Guid userId2)
    {
        return _context.Messages.Where(m =>
            m.ServiceRequestId == serviceRequestId &&
            ((m.FromUserId == userId1 && m.ToUserId == userId2) ||
             (m.FromUserId == userId2 && m.ToUserId == userId1)));
    }
}
