using LittleService.Domain.Entities;

namespace LittleService.Infrastructure.Repositories.Roles;

public interface IRoleRepository
{
    Task<IEnumerable<Role>> GetAllAsync();
    Task<Role?> GetByIdAsync(Guid id);
    Task<Role?> GetByNameAsync(string name);
    Task<IEnumerable<Role>> GetByNamesAsync(IEnumerable<string> names);
    Task<Role> AddAsync(Role role);
    Task UpdateAsync(Role role);
    Task<bool> DeleteAsync(Guid id);
}