using LittleService.Domain.Entities;

namespace LittleService.Domain.Interfaces.Repositories;

public interface INotificationRepository
{
    //? CRUD Basic Methods
    Task<Notification?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<Notification> AddAsync(Notification notification, CancellationToken cancellationToken = default);
    Task UpdateAsync(Notification notification, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query for User (1:N)
    Task<IEnumerable<Notification>> GetByUserIdAsync(Guid userId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Notification>> GetUnreadByUserIdAsync(Guid userId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Notification>> GetReadByUserIdAsync(Guid userId, CancellationToken cancellationToken = default);

    //? Query for types
    Task<IEnumerable<Notification>> GetByTypeAsync(string type, CancellationToken cancellationToken = default);
    Task<IEnumerable<Notification>> GetByUserIdAndTypeAsync(Guid userId, string type, CancellationToken cancellationToken = default);

    //? Queries for status reading
    Task<IEnumerable<Notification>> GetUnreadNotificationsAsync(Guid userId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Notification>> GetReadNotificationsAsync(Guid userId, CancellationToken cancellationToken = default);

    //? Combined Queries
    Task<IEnumerable<Notification>> GetUnreadByUserIdAndTypeAsync(Guid userId, string type, CancellationToken cancellationToken = default);

    //? Queries for date range
    Task<IEnumerable<Notification>> GetByUserIdAndDateRangeAsync(Guid userId, DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default);
    Task<IEnumerable<Notification>> GetRecentByUserIdAsync(Guid userId, int count, CancellationToken cancellationToken = default);

    //? Methods to update status
    Task<int> MarkAllAsReadByUserIdAsync(Guid userId, CancellationToken cancellationToken = default);
    Task<int> MarkAsReadByIdAsync(Guid notificationId, CancellationToken cancellationToken = default);
    Task<int> MarkAllAsReadByUserIdAndTypeAsync(Guid userId, string type, CancellationToken cancellationToken = default);

    //? Queries for count
    Task<int> GetUnreadCountByUserIdAsync(Guid userId, CancellationToken cancellationToken = default);
    Task<int> GetUnreadCountByUserIdAndTypeAsync(Guid userId, string type, CancellationToken cancellationToken = default);

    //? Queries for validations
    Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default);
}