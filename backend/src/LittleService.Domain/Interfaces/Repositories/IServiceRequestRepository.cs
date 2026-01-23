using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Domain.Interfaces.Repositories;

public interface IServiceRequestRepository
{
    //? CRUD Basic Methods
    Task<ServiceRequest?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<ServiceRequest> AddAsync(ServiceRequest serviceRequest, CancellationToken cancellationToken = default);
    Task UpdateAsync(ServiceRequest serviceRequest, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query Methods for relationships
    Task<IEnumerable<ServiceRequest>> GetByClientIdAsync(Guid clientId, CancellationToken cancellationToken = default);
    Task<IEnumerable<ServiceRequest>> GetByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default);

    //? Query Methods for status
    Task<IEnumerable<ServiceRequest>> GetByStatusAsync(ServiceRequestStatus status, CancellationToken cancellationToken = default);
    Task<IEnumerable<ServiceRequest>> GetOpenRequestsAsync(CancellationToken cancellationToken = default); //? Opened requests

    //? Combined Query Methods
    Task<IEnumerable<ServiceRequest>> GetOpenRequestsByClientIdAsync(Guid clientId, CancellationToken cancellationToken = default);
    Task<IEnumerable<ServiceRequest>> GetByFreelancerIdAndStatusAsync(Guid freelancerId, ServiceRequestStatus status, CancellationToken cancellationToken = default);

    //? Queries for validations
    Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default);
    Task<bool> CanAcceptApplicationsAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);
}