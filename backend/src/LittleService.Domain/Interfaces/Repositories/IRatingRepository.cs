using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Domain.Interfaces.Repositories;

public interface IRatingRepository
{
    //? CRUD Basic Methods
    Task<Rating?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<Rating> AddAsync(Rating rating, CancellationToken cancellationToken = default);
    Task UpdateAsync(Rating rating, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query for ServiceRequest (1:N)
    Task<IEnumerable<Rating>> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Rating>> GetActiveByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);

    //? Query for User (who is being rated)
    Task<IEnumerable<Rating>> GetByUserRevieweeIdAsync(Guid userId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Rating>> GetActiveByUserRevieweeIdAsync(Guid userId, CancellationToken cancellationToken = default);

    //? Query for User (who is giving the rating)
    Task<IEnumerable<Rating>> GetByUserReviewerIdAsync(Guid userId, CancellationToken cancellationToken = default);

    //? Query for role that is being rated
    Task<IEnumerable<Rating>> GetByReceiverRoleAsync(RatingReceiverRole receiverRole, CancellationToken cancellationToken = default);
    Task<IEnumerable<Rating>> GetActiveByReceiverRoleAsync(RatingReceiverRole receiverRole, CancellationToken cancellationToken = default);

    //? Query for activity status
    Task<IEnumerable<Rating>> GetActiveRatingsAsync(CancellationToken cancellationToken = default);
    Task<IEnumerable<Rating>> GetDeactivatedRatingsAsync(CancellationToken cancellationToken = default);

    //? Combined Queries
    Task<IEnumerable<Rating>> GetActiveByUserRevieweeIdAndReceiverRoleAsync(Guid userId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default);
    Task<Rating?> GetByServiceRequestAndReviewerAndReceiverRoleAsync(Guid serviceRequestId, Guid reviewerId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default);

    //? Queries for moderation
    Task<IEnumerable<Rating>> GetRatingsToPermanentlyDeleteAsync(CancellationToken cancellationToken = default);
    Task<IEnumerable<Rating>> GetDeactivatedRatingsByModeratorIdAsync(Guid moderatorId, CancellationToken cancellationToken = default);

    //? Queries for statistics
    Task<double> GetAverageRatingByUserRevieweeIdAsync(Guid userRevieweeId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default);
    Task<int> GetRatingCountByUserRevieweeIdAsync(Guid userRevieweeId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default);

    //? Queries for validations
    Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default);
    Task<bool> ExistsByServiceRequestAndReviewerAndReceiverRoleAsync(Guid serviceRequestId, Guid reviewerId, RatingReceiverRole receiverRole, CancellationToken cancellationToken = default);

}