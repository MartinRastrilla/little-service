using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Repositories;

public class ServiceRepository : IServiceRepository
{
    private readonly AppDbContext _context;

    public ServiceRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<Service>> GetAllAsync()
    {
        return await _context.Services.ToListAsync();
    }

    public async Task<Service> GetByIdAsync(Guid id)
    {
        return await _context.Services.FirstOrDefaultAsync(s => s.Id == id) ?? throw new Exception("Service not found");
    }

    public async Task<Service> AddAsync(Service service)
    {
        _context.Services.Add(service);
        await _context.SaveChangesAsync();
        return service;
    }

    public async Task UpdateAsync(Service service)
    {
        _context.Services.Update(service);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(Guid id)
    {
        var service = await GetByIdAsync(id);
        _context.Services.Remove(service);
        await _context.SaveChangesAsync();
    }
}