using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Queries;

namespace LittleService.Domain.Interfaces.Repositories;

public interface IFreelancerApplicationRepository
{
    //? CRUD Basic Methods
    Task<FreelancerApplication?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<FreelancerApplication> AddAsync(FreelancerApplication freelancerApplication, CancellationToken cancellationToken = default);
    Task UpdateAsync(FreelancerApplication freelancerApplication, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query Methods for relationships
    Task<IEnumerable<FreelancerApplication>> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<FreelancerApplicationSummaryReadModel>> GetSummariesByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);
    Task<IEnumerable<FreelancerApplication>> GetByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<FreelancerApplicationSummaryReadModel>> GetSummariesByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default);

    //? Query Methods for status
    Task<IEnumerable<FreelancerApplication>> GetByStatusAsync(FreelancerApplicationStatus status, CancellationToken cancellationToken = default);
    Task<IEnumerable<FreelancerApplication>> GetPendingByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);

    //? Combined Query Methods
    Task<IEnumerable<FreelancerApplication>> GetByFreelancerIdAndStatusAsync(Guid freelancerId, FreelancerApplicationStatus status, CancellationToken cancellationToken = default);
    Task<IEnumerable<FreelancerApplication>> GetByServiceRequestIdAndStatusAsync(Guid serviceRequestId, FreelancerApplicationStatus status, CancellationToken cancellationToken = default);

    //? Queries for validations
    Task<bool> ExistsAsync(Guid serviceRequestId, Guid freelancerId, CancellationToken cancellationToken = default);
    Task<FreelancerApplication?> GetByServiceRequestAndFreelancerAsync(Guid serviceRequestId, Guid freelancerId, CancellationToken cancellationToken = default);
    Task<bool> HasPendingApplicationAsync(Guid serviceRequestId, Guid freelancerId, CancellationToken cancellationToken = default);
    Task<int> GetPendingCountByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<FreelancerApplicationSummaryReadModel>> GetRecentPendingSummariesByServiceRequestIdAsync(
        Guid serviceRequestId,
        int limit,
        CancellationToken cancellationToken = default);
    Task<IReadOnlyList<FreelancerWorkItemSummaryReadModel>> GetWorkItemSummariesByFreelancerIdAsync(
        Guid freelancerId,
        FreelancerApplicationStatus? statusFilter,
        CancellationToken cancellationToken = default);
}