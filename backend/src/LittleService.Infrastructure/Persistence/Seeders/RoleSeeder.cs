using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.Extensions.Logging;

namespace LittleService.Infrastructure.Persistence.Seeders;

/// <summary>
/// Role seeder
/// </summary>
public class RoleSeeder
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<RoleSeeder> _logger;

    public RoleSeeder(IUnitOfWork unitOfWork, ILogger<RoleSeeder> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async Task SeedAsync(CancellationToken cancellationToken = default)
    {
        _logger.LogInformation("Seeding roles...");

        var defaultRoles = SeedData.GetDefaultRoles().ToList();
        var existingRoles = await _unitOfWork.Roles.GetAllAsync(cancellationToken);

        var rolesToAdd = new List<Role>();

        foreach (var role in defaultRoles)
        {
            //? Verify if role already exists
            var existingRole = existingRoles.FirstOrDefault(r =>
                r.Name.Equals(role.Name, StringComparison.OrdinalIgnoreCase));

            if (existingRole == null)
            {
                _logger.LogInformation("Adding role: {RoleName}", role.Name);
                rolesToAdd.Add(role);
            }
            else
            {
                _logger.LogInformation("Role already exists: {RoleName}", role.Name);
            }
        }

        if (rolesToAdd.Count > 0)
        {
            await _unitOfWork.BeginTransactionAsync(cancellationToken);
            try
            {
                foreach (var role in rolesToAdd)
                {
                    await _unitOfWork.Roles.AddAsync(role, cancellationToken);
                }
                await _unitOfWork.SaveChangesAsync(cancellationToken);
                await _unitOfWork.CommitTransactionAsync(cancellationToken);
                _logger.LogInformation("Roles added: {RoleCount}", rolesToAdd.Count);
            }
            catch
            {
                _logger.LogError("All roles already exist, seeding aborted");
            }
        }
    }
}