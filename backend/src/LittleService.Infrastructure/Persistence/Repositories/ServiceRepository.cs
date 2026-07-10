using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;
using LittleService.Domain.Queries;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class ServiceRepository : IServiceRepository
{
    private readonly AppDbContext _context;

    public ServiceRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<Service?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .Include(s => s.Freelancer)
            .FirstOrDefaultAsync(s => s.Id == id, cancellationToken);
    }

    public async Task<Service> AddAsync(Service service, CancellationToken cancellationToken = default)
    {
        await _context.Services.AddAsync(service, cancellationToken);
        return service;
    }

    public async Task UpdateAsync(Service service, CancellationToken cancellationToken = default)
    {
        _context.Services.Update(service);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var service = await GetByIdAsync(id, cancellationToken);
        if (service == null) return false;

        _context.Services.Remove(service);
        return true;
    }

    public async Task<IEnumerable<Service>> GetByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .Include(s => s.Freelancer)
            .Where(s => s.FreelancerId == freelancerId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<ServiceSummaryReadModel>> GetSummariesByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .AsNoTracking()
            .Where(s => s.FreelancerId == freelancerId)
            .Select(s => new ServiceSummaryReadModel
            {
                Id = s.Id,
                FreelancerId = s.FreelancerId,
                Title = s.Title,
                Description = s.Description,
                Price = s.Price,
                IsActive = s.IsActive,
                CreatedAt = s.CreatedAt
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Service>> GetActiveByFreelancerIdAsync(Guid freelancerId, CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .Include(s => s.Freelancer)
            .Where(s => s.FreelancerId == freelancerId && s.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Service>> GetActiveServicesAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .Include(s => s.Freelancer)
            .Where(s => s.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Service>> GetInactiveServicesAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .Include(s => s.Freelancer)
            .Where(s => !s.IsActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Service>> GetByFreelancerIdAndIsActiveAsync(Guid freelancerId, bool isActive, CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .Include(s => s.Freelancer)
            .Where(s => s.FreelancerId == freelancerId && s.IsActive == isActive)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Service>> GetByPriceRangeAsync(decimal minPrice, decimal maxPrice, CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .Include(s => s.Freelancer)
            .Where(s => s.Price >= minPrice && s.Price <= maxPrice)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Service>> GetActiveByPriceRangeAsync(decimal minPrice, decimal maxPrice, CancellationToken cancellationToken = default)
    {
        return await _context.Services
            .Include(s => s.Freelancer)
            .Where(s => s.IsActive && s.Price >= minPrice && s.Price <= maxPrice)
            .ToListAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Services.AnyAsync(s => s.Id == id, cancellationToken);
    }
}