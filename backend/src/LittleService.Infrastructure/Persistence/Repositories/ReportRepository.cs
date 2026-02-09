using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class ReportRepository : IReportRepository
{
    private readonly AppDbContext _context;

    public ReportRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<Report?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .FirstOrDefaultAsync(r => r.Id == id, cancellationToken);
    }

    public async Task<Report> AddAsync(Report report, CancellationToken cancellationToken = default)
    {
        await _context.Reports.AddAsync(report, cancellationToken);
        return report;
    }

    public async Task UpdateAsync(Report report, CancellationToken cancellationToken = default)
    {
        _context.Reports.Update(report);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var report = await GetByIdAsync(id, cancellationToken);
        if (report == null) return false;
        _context.Reports.Remove(report);
        return true;
    }

    public async Task<IEnumerable<Report>> GetByReporterIdAsync(Guid reporterId, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ReporterId == reporterId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Report>> GetByReportedUserIdAsync(Guid reportedUserId, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ReportedUserId == reportedUserId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Report>> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ServiceRequestId == serviceRequestId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Report>> GetByReportedUserIdAndServiceRequestIdAsync(Guid reportedUserId, Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ReportedUserId == reportedUserId && r.ServiceRequestId == serviceRequestId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Report>> GetByReporterIdAndReportedUserIdAsync(Guid reporterId, Guid reportedUserId, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ReporterId == reporterId && r.ReportedUserId == reportedUserId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Report>> GetByDateRangeAsync(DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.CreatedAt >= startDate && r.CreatedAt <= endDate)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Report>> GetByReporterIdAndDateRangeAsync(Guid reporterId, DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ReporterId == reporterId && r.CreatedAt >= startDate && r.CreatedAt <= endDate)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Report>> GetByReportedUserIdAndDateRangeAsync(Guid reportedUserId, DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ReportedUserId == reportedUserId && r.CreatedAt >= startDate && r.CreatedAt <= endDate)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Report>> GetRecentReportsAsync(int count, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .OrderByDescending(r => r.CreatedAt)
            .Take(count)
            .ToListAsync(cancellationToken);
    }

    public async Task<int> GetReportCountByReportedUserIdAsync(Guid reportedUserId, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ReportedUserId == reportedUserId)
            .CountAsync(cancellationToken);
    }

    public async Task<int> GetReportCountByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Reports
            .Include(r => r.Reporter)
            .Include(r => r.ReportedUser)
            .Include(r => r.ServiceRequest)
            .Where(r => r.ServiceRequestId == serviceRequestId)
            .CountAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Reports.AnyAsync(r => r.Id == id, cancellationToken);
    }

    public async Task<bool> ExistsByReporterIdAndReportedUserIdAndServiceRequestIdAsync(Guid reporterId, Guid reportedUserId, Guid? serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Reports.AnyAsync(r => r.ReporterId == reporterId && r.ReportedUserId == reportedUserId && r.ServiceRequestId == serviceRequestId, cancellationToken);
    }
}