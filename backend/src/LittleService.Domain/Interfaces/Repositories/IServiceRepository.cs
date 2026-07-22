using LittleService.Domain.Entities;
using LittleService.Domain.Queries;

namespace LittleService.Domain.Interfaces.Repositories;

public interface IServiceRepository
{
    //? CRUD Basic Methods
    Task<Service?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<Service> AddAsync(Service service, CancellationToken cancellationToken = default);
    Task UpdateAsync(Service service, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query for Freelancer (1:N)
    Task<IEnumerable<Service>> GetByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<ServiceSummaryReadModel>> GetSummariesByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default);
    Task<int> CountActiveByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<ServiceSummaryReadModel>> GetActiveSummariesByFreelancerIdAsync(
        Guid freelancerId,
        int limit,
        CancellationToken cancellationToken = default);
    Task<IEnumerable<Service>> GetActiveByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default);

    //? Query for status
    Task<IEnumerable<Service>> GetActiveServicesAsync(CancellationToken cancellationToken = default);
    Task<IEnumerable<Service>> GetInactiveServicesAsync(CancellationToken cancellationToken = default);

    //? Combines Queries
    Task<IEnumerable<Service>> GetByFreelancerIdAndIsActiveAsync(Guid freelancerId, bool isActive, CancellationToken cancellationToken = default);

    //? Queries for price range
    Task<IEnumerable<Service>> GetByPriceRangeAsync(decimal minPrice, decimal maxPrice, CancellationToken cancellationToken = default);
    Task<IEnumerable<Service>> GetActiveByPriceRangeAsync(decimal minPrice, decimal maxPrice, CancellationToken cancellationToken = default);

    //? Queries for validations
    Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default);
}