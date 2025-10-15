using LittleService.Domain.Entities;

namespace LittleService.Infrastructure.Repositories;

public interface IServiceRepository
{
    Task<IEnumerable<Service>> GetAllAsync();
    Task<Service> GetByIdAsync(Guid id);
    Task<Service> AddAsync(Service service);
    Task UpdateAsync(Service service);
    Task DeleteAsync(Guid id);
}
