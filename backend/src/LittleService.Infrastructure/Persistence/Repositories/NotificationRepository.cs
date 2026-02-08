using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class NotificationRepository : INotificationRepository
{
    private readonly AppDbContext _context;

    public NotificationRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<Notification?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .FirstOrDefaultAsync(n => n.Id == id, cancellationToken);
    }

    public async Task<Notification> AddAsync(Notification notification, CancellationToken cancellationToken = default)
    {
        await _context.Notifications.AddAsync(notification, cancellationToken);
        return notification;
    }

    public async Task UpdateAsync(Notification notification, CancellationToken cancellationToken = default)
    {
        _context.Notifications.Update(notification);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var notification = await GetByIdAsync(id, cancellationToken);
        if (notification == null) return false;
        _context.Notifications.Remove(notification);
        return true;
    }

    public async Task<IEnumerable<Notification>> GetByUserIdAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetUnreadByUserIdAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId && !n.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetReadByUserIdAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId && n.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetByTypeAsync(string type, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.Type == type)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetByUserIdAndTypeAsync(Guid userId, string type, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId && n.Type == type)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetUnreadNotificationsAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId && !n.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetReadNotificationsAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId && n.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetUnreadByUserIdAndTypeAsync(Guid userId, string type, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId && n.Type == type && !n.IsRead)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetByUserIdAndDateRangeAsync(Guid userId, DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId && n.CreatedAt >= startDate && n.CreatedAt <= endDate)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Notification>> GetRecentByUserIdAsync(Guid userId, int count, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Include(n => n.User)
            .Where(n => n.UserId == userId)
            .OrderByDescending(n => n.CreatedAt)
            .Take(count)
            .ToListAsync(cancellationToken);
    }

    public async Task<int> MarkAllAsReadByUserIdAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Where(n => n.UserId == userId)
            .ExecuteUpdateAsync(n => n.SetProperty(n => n.IsRead, true), cancellationToken);
    }

    public async Task<int> MarkAsReadByIdAsync(Guid notificationId, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Where(n => n.Id == notificationId)
            .ExecuteUpdateAsync(n => n.SetProperty(n => n.IsRead, true), cancellationToken);
    }

    public async Task<int> MarkAllAsReadByUserIdAndTypeAsync(Guid userId, string type, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Where(n => n.UserId == userId && n.Type == type)
            .ExecuteUpdateAsync(n => n.SetProperty(n => n.IsRead, true), cancellationToken);
    }

    public async Task<int> GetUnreadCountByUserIdAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Where(n => n.UserId == userId && !n.IsRead)
            .CountAsync(cancellationToken);
    }

    public async Task<int> GetUnreadCountByUserIdAndTypeAsync(Guid userId, string type, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications
            .Where(n => n.UserId == userId && n.Type == type && !n.IsRead)
            .CountAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Notifications.AnyAsync(n => n.Id == id, cancellationToken);
    }
}