using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using LittleService.Domain.Queries;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class ServiceRequestRepository : IServiceRequestRepository
{
    private readonly AppDbContext _context;

    public ServiceRequestRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<ServiceRequest?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .Include(sr => sr.Client)
            .Include(sr => sr.FreelancerPicked)
            .Include(sr => sr.Contract)
            .Include(sr => sr.Photos)
            .FirstOrDefaultAsync(sr => sr.Id == id, cancellationToken);
    }

    public async Task<ServiceRequest> AddAsync(ServiceRequest serviceRequest, CancellationToken cancellationToken = default)
    {
        await _context.ServiceRequests.AddAsync(serviceRequest, cancellationToken);
        return serviceRequest;
    }

    public async Task UpdateAsync(ServiceRequest serviceRequest, CancellationToken cancellationToken = default)
    {
        _context.ServiceRequests.Update(serviceRequest);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var serviceRequest = await GetByIdAsync(id, cancellationToken);
        if (serviceRequest == null) return false;

        _context.ServiceRequests.Remove(serviceRequest);
        return true;
    }

    public async Task<IEnumerable<ServiceRequest>> GetByClientIdAsync(Guid clientId, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .Where(sr => sr.ClientId == clientId)
            .Include(sr => sr.FreelancerPicked)
            .Include(sr => sr.Contract)
            .Include(sr => sr.Photos)
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<ServiceRequestSummaryReadModel>> GetSummariesByClientIdAsync(Guid clientId, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .AsNoTracking()
            .Where(sr => sr.ClientId == clientId)
            .OrderByDescending(sr => sr.CreatedAt)
            .Select(sr => new ServiceRequestSummaryReadModel
            {
                Id = sr.Id,
                Title = sr.Title,
                Description = sr.Description,
                Location = sr.Location,
                Status = sr.Status,
                Price = sr.Price,
                ClientId = sr.ClientId,
                FreelancerPickedId = sr.FreelancerPickedId,
                PhotosCount = sr.Photos.Count,
                ContractStatus = sr.Contract != null ? sr.Contract.Status : null,
                CoverPhotoPath = sr.Photos
                    .OrderBy(p => p.CreatedAt)
                    .Select(p => p.FilePath)
                    .FirstOrDefault(),
                CreatedAt = sr.CreatedAt
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<ServiceRequest>> GetByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .Where(sr => sr.FreelancerPickedId == freelancerId)
            .Include(sr => sr.FreelancerPicked)
            .Include(sr => sr.Contract)
            .Include(sr => sr.Photos)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<ServiceRequest>> GetByStatusAsync(ServiceRequestStatus status, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .Where(sr => sr.Status == status)
            .Include(sr => sr.FreelancerPicked)
            .Include(sr => sr.Contract)
            .Include(sr => sr.Photos)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<ServiceRequest>> GetOpenRequestsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .Where(sr => sr.Status == ServiceRequestStatus.Opened)
            .Include(sr => sr.Photos)
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<ServiceRequestSummaryReadModel>> GetOpenSummariesAsync(CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .AsNoTracking()
            .Where(sr => sr.Status == ServiceRequestStatus.Opened)
            .OrderByDescending(sr => sr.CreatedAt)
            .Select(sr => new ServiceRequestSummaryReadModel
            {
                Id = sr.Id,
                Title = sr.Title,
                Description = sr.Description,
                Location = sr.Location,
                Status = sr.Status,
                Price = sr.Price,
                ClientId = sr.ClientId,
                FreelancerPickedId = sr.FreelancerPickedId,
                PhotosCount = sr.Photos.Count,
                ContractStatus = sr.Contract != null ? sr.Contract.Status : null,
                CoverPhotoPath = sr.Photos
                    .OrderBy(p => p.CreatedAt)
                    .Select(p => p.FilePath)
                    .FirstOrDefault(),
                CreatedAt = sr.CreatedAt
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<ServiceRequest>> GetOpenRequestsByClientIdAsync(Guid clientId, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .Where(sr => sr.ClientId == clientId && sr.Status == ServiceRequestStatus.Opened)
            .Include(sr => sr.Photos)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<ServiceRequest>> GetByFreelancerIdAndStatusAsync(Guid freelancerId, ServiceRequestStatus status, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .Where(sr => sr.FreelancerPickedId == freelancerId && sr.Status == status)
            .Include(sr => sr.FreelancerPicked)
            .Include(sr => sr.Contract)
            .Include(sr => sr.Photos)
            .ToListAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests.AnyAsync(sr => sr.Id == id, cancellationToken);
    }

    public async Task<ServiceRequest?> GetByIdWithApplicationsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests
            .Include(sr => sr.Client)
                .ThenInclude(c => c.User)
            .Include(sr => sr.FreelancerPicked)
                .ThenInclude(f => f!.User)
            .Include(sr => sr.Photos)
            .Include(sr => sr.FreelancerApplications)
                .ThenInclude(fa => fa.Freelancer)
                    .ThenInclude(f => f.User)
            .Include(sr => sr.Contract)
            .FirstOrDefaultAsync(sr => sr.Id == id, cancellationToken);
    }

    public async Task<bool> CanAcceptApplicationsAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.ServiceRequests.AnyAsync(sr => sr.Id == serviceRequestId && sr.CanAcceptApplications(), cancellationToken);
    }
}