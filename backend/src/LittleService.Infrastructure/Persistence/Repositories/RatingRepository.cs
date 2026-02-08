using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class RatingRepository : IRatingRepository
{
    private readonly AppDbContext _context;

    public RatingRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<Rating?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .FirstOrDefaultAsync(r => r.Id == id, cancellationToken);
    }

    public async Task<Rating> AddAsync(Rating rating, CancellationToken cancellationToken = default)
    {
        await _context.Ratings.AddAsync(rating, cancellationToken);
        return rating;
    }

    public async Task UpdateAsync(Rating rating, CancellationToken cancellationToken = default)
    {
        _context.Ratings.Update(rating);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var rating = await GetByIdAsync(id, cancellationToken);
        if (rating == null) return false;
        _context.Ratings.Remove(rating);
        return true;
    }

    public async Task<IEnumerable<Rating>> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.ServiceRequestId == serviceRequestId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetActiveByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.ServiceRequestId == serviceRequestId && r.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetByUserRevieweeIdAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.UserRevieweeId == userId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetActiveByUserRevieweeIdAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.UserRevieweeId == userId && r.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetByUserReviewerIdAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.UserReviewerId == userId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetByReceiverRoleAsync(RatingReceiverRole receiverRole, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.ReceiverRole == receiverRole)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetActiveByReceiverRoleAsync(RatingReceiverRole receiverRole, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.ReceiverRole == receiverRole && r.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetActiveRatingsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetDeactivatedRatingsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => !r.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetActiveByUserRevieweeIdAndReceiverRoleAsync(Guid userId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.UserRevieweeId == userId && r.ReceiverRole == receiverRole && r.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<Rating?> GetByServiceRequestAndReviewerAndReceiverRoleAsync(Guid serviceRequestId, Guid reviewerId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .FirstOrDefaultAsync(r => r.ServiceRequestId == serviceRequestId && r.UserReviewerId == reviewerId && r.ReceiverRole == receiverRole, cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetRatingsToPermanentlyDeleteAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => !r.IsActive && r.EditCountWhileDeactivated >= Rating.MAX_EDIT_COUNT)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Rating>> GetDeactivatedRatingsByModeratorIdAsync(Guid moderatorId, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.DeactivatedById == moderatorId && !r.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<double> GetAverageRatingByUserRevieweeIdAsync(Guid userRevieweeId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.UserRevieweeId == userRevieweeId && r.ReceiverRole == receiverRole)
            .AverageAsync(r => r.Score, cancellationToken);
    }

    public async Task<int> GetRatingCountByUserRevieweeIdAsync(Guid userRevieweeId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(r => r.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(r => r.UserReviewee)
            .Include(r => r.UserReviewer)
            .Include(r => r.DeactivatedBy)
            .Where(r => r.UserRevieweeId == userRevieweeId && r.ReceiverRole == receiverRole)
            .CountAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings.AnyAsync(r => r.Id == id, cancellationToken);
    }

    public async Task<bool> ExistsByServiceRequestAndReviewerAndReceiverRoleAsync(Guid serviceRequestId, Guid reviewerId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default)
    {
        return await _context.Ratings.AnyAsync(r => r.ServiceRequestId == serviceRequestId && r.UserReviewerId == reviewerId && r.ReceiverRole == receiverRole, cancellationToken);
    }
}