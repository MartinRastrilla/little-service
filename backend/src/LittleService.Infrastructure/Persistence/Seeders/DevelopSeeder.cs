using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.Extensions.Logging;

namespace LittleService.Infrastructure.Persistence.Seeders;

/// <summary>
/// Seeds development-only data for local testing.
/// </summary>
public class DevelopSeeder
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly ILogger<DevelopSeeder> _logger;

    public DevelopSeeder(
        IUnitOfWork unitOfWork,
        IPasswordHasher passwordHasher,
        ILogger<DevelopSeeder> logger)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _logger = logger;
    }

    public async Task SeedAsync(CancellationToken cancellationToken = default)
    {
        _logger.LogInformation("Seeding development data...");

        var existingUser = await _unitOfWork.Users.GetByEmailAsync(
            SeedData.DevelopmentAdminEmail,
            cancellationToken);

        if (existingUser != null)
        {
            _logger.LogInformation(
                "Development admin user already exists: {Email}",
                SeedData.DevelopmentAdminEmail);
            return;
        }

        var superAdminRole = await _unitOfWork.Roles.GetByNameAsync(
            SeedData.DevelopmentAdminRoleName,
            cancellationToken);

        if (superAdminRole == null)
        {
            _logger.LogError(
                "Role '{RoleName}' not found. Run role seeder first.",
                SeedData.DevelopmentAdminRoleName);
            return;
        }

        var hashedPassword = _passwordHasher.HashPassword(SeedData.DevelopmentAdminPassword);
        var adminUser = User.Create(
            SeedData.DevelopmentAdminName,
            SeedData.DevelopmentAdminEmail,
            hashedPassword);

        adminUser.AddRole(superAdminRole);

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.Users.AddAsync(adminUser, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
            _logger.LogInformation(
                "Development admin user created: {Email} with role {RoleName}",
                SeedData.DevelopmentAdminEmail,
                SeedData.DevelopmentAdminRoleName);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error seeding development admin user");
            throw;
        }
    }
}
