using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using LittleService.Domain.Queries;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class FreelancerApplicationRepository : IFreelancerApplicationRepository
{
    private readonly AppDbContext _context;

    public FreelancerApplicationRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<FreelancerApplication?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .Include(fa => fa.ServiceRequest)
            .Include(fa => fa.Freelancer)
                .ThenInclude(f => f.User)
            .FirstOrDefaultAsync(fa => fa.Id == id, cancellationToken);
    }

    public async Task<FreelancerApplication> AddAsync(FreelancerApplication freelancerApplication, CancellationToken cancellationToken = default)
    {
        await _context.FreelancerApplications.AddAsync(freelancerApplication, cancellationToken);
        return freelancerApplication;
    }

    public async Task UpdateAsync(FreelancerApplication freelancerApplication, CancellationToken cancellationToken = default)
    {
        _context.FreelancerApplications.Update(freelancerApplication);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var freelancerApplication = await GetByIdAsync(id, cancellationToken);
        if (freelancerApplication == null) return false;

        _context.FreelancerApplications.Remove(freelancerApplication);
        return true;
    }

    public async Task<IEnumerable<FreelancerApplication>> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .Where(fa => fa.ServiceRequestId == serviceRequestId)
            .Include(fa => fa.ServiceRequest)
            .Include(fa => fa.Freelancer)
                .ThenInclude(f => f.User)
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<FreelancerApplicationSummaryReadModel>> GetSummariesByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .AsNoTracking()
            .Where(fa => fa.ServiceRequestId == serviceRequestId)
            .Select(fa => new FreelancerApplicationSummaryReadModel
            {
                Id = fa.Id,
                ServiceRequestId = fa.ServiceRequestId,
                FreelancerId = fa.FreelancerId,
                FreelancerName = fa.Freelancer.User.Name,
                FreelancerProfilePicture = fa.Freelancer.User.ProfilePictureUrl,
                RatingAverage = fa.Freelancer.RatingAverage,
                RatingCount = fa.Freelancer.RatingCount,
                Bio = fa.Freelancer.Bio,
                Status = fa.Status,
                CreatedAt = fa.CreatedAt
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<FreelancerApplication>> GetByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .Where(fa => fa.FreelancerId == freelancerId)
            .Include(fa => fa.ServiceRequest)
            .Include(fa => fa.Freelancer)
                .ThenInclude(f => f.User)
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<FreelancerApplicationSummaryReadModel>> GetSummariesByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .AsNoTracking()
            .Where(fa => fa.FreelancerId == freelancerId)
            .Select(fa => new FreelancerApplicationSummaryReadModel
            {
                Id = fa.Id,
                ServiceRequestId = fa.ServiceRequestId,
                FreelancerId = fa.FreelancerId,
                FreelancerName = fa.Freelancer.User.Name,
                FreelancerProfilePicture = fa.Freelancer.User.ProfilePictureUrl,
                RatingAverage = fa.Freelancer.RatingAverage,
                RatingCount = fa.Freelancer.RatingCount,
                Bio = fa.Freelancer.Bio,
                Status = fa.Status,
                CreatedAt = fa.CreatedAt
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<FreelancerApplication>> GetByStatusAsync(FreelancerApplicationStatus status, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .Where(fa => fa.Status == status)
            .Include(fa => fa.ServiceRequest)
            .Include(fa => fa.Freelancer)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<FreelancerApplication>> GetPendingByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .Where(fa => fa.ServiceRequestId == serviceRequestId && fa.Status == FreelancerApplicationStatus.Pending)
            .Include(fa => fa.ServiceRequest)
            .Include(fa => fa.Freelancer)
            .ToListAsync(cancellationToken);
    }

    public async Task<int> GetPendingCountByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .CountAsync(
                fa => fa.ServiceRequestId == serviceRequestId &&
                      fa.Status == FreelancerApplicationStatus.Pending,
                cancellationToken);
    }

    public async Task<IEnumerable<FreelancerApplication>> GetByFreelancerIdAndStatusAsync(Guid freelancerId, FreelancerApplicationStatus status, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .Where(fa => fa.FreelancerId == freelancerId && fa.Status == status)
            .Include(fa => fa.ServiceRequest)
            .Include(fa => fa.Freelancer)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<FreelancerApplication>> GetByServiceRequestIdAndStatusAsync(Guid serviceRequestId, FreelancerApplicationStatus status, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .Where(fa => fa.ServiceRequestId == serviceRequestId && fa.Status == status)
            .Include(fa => fa.ServiceRequest)
            .Include(fa => fa.Freelancer)
            .ToListAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid serviceRequestId, Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications.AnyAsync(fa => fa.ServiceRequestId == serviceRequestId && fa.FreelancerId == freelancerId, cancellationToken);
    }

    public async Task<FreelancerApplication?> GetByServiceRequestAndFreelancerAsync(Guid serviceRequestId, Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications
            .Where(fa => fa.ServiceRequestId == serviceRequestId && fa.FreelancerId == freelancerId)
            .Include(fa => fa.ServiceRequest)
            .Include(fa => fa.Freelancer)
                .ThenInclude(f => f.User)
            .FirstOrDefaultAsync(cancellationToken);
    }

    public async Task<bool> HasPendingApplicationAsync(Guid serviceRequestId, Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.FreelancerApplications.AnyAsync(fa => fa.ServiceRequestId == serviceRequestId && fa.FreelancerId == freelancerId && fa.Status == FreelancerApplicationStatus.Pending, cancellationToken);
    }
}