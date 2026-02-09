using LittleService.Domain.Entities;

namespace LittleService.Domain.Interfaces.Repositories;

public interface IReportRepository
{
    //? CRUD Basic Methods
    Task<Report?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<Report> AddAsync(Report report, CancellationToken cancellationToken = default);
    Task UpdateAsync(Report report, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query for Reporter (the user who is reporting)
    Task<IEnumerable<Report>> GetByReporterIdAsync(Guid reporterId, CancellationToken cancellationToken = default);

    //? Query for Reported User (the user who is being reported)
    Task<IEnumerable<Report>> GetByReportedUserIdAsync(Guid reportedUserId, CancellationToken cancellationToken = default);

    //? Query for Service Request (the service request that is being reported)
    Task<IEnumerable<Report>> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);

    //? Combined Queries (important for moderation purposes)
    Task<IEnumerable<Report>> GetByReportedUserIdAndServiceRequestIdAsync(Guid reportedUserId, Guid serviceRequestId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Report>> GetByReporterIdAndReportedUserIdAsync(Guid reporterId, Guid reportedUserId, CancellationToken cancellationToken = default);

    //? Queries for date ranges
    Task<IEnumerable<Report>> GetByDateRangeAsync(DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default);
    Task<IEnumerable<Report>> GetByReporterIdAndDateRangeAsync(Guid reporterId, DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default);
    Task<IEnumerable<Report>> GetByReportedUserIdAndDateRangeAsync(Guid reportedUserId, DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default);

    //? Recent Queries
    Task<IEnumerable<Report>> GetRecentReportsAsync(int count, CancellationToken cancellationToken = default);

    //? Queries for statistics
    Task<int> GetReportCountByReportedUserIdAsync(Guid reportedUserId, CancellationToken cancellationToken = default);
    Task<int> GetReportCountByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);

    //? Queries for validations
    Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default);
    Task<bool> ExistsByReporterIdAndReportedUserIdAndServiceRequestIdAsync(Guid reporterId, Guid reportedUserId, Guid? serviceRequestId, CancellationToken cancellationToken = default);
}