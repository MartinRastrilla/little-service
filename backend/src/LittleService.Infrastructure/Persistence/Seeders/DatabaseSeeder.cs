using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.Extensions.Logging;

namespace LittleService.Infrastructure.Persistence.Seeders;

/// <summary>
/// Database seeder for seeding the database with default data
/// </summary>
public class DatabaseSeeder
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly bool _isDevelopment;
    private readonly ILogger<DatabaseSeeder> _logger;
    private readonly ILoggerFactory _loggerFactory;

    public DatabaseSeeder(
        IUnitOfWork unitOfWork,
        IPasswordHasher passwordHasher,
        bool isDevelopment,
        ILogger<DatabaseSeeder> logger,
        ILoggerFactory loggerFactory)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _isDevelopment = isDevelopment;
        _logger = logger;
        _loggerFactory = loggerFactory;
    }

    public async Task SeedAsync(CancellationToken cancellationToken = default)
    {
        _logger.LogInformation("Seeding database...");
        try
        {
            //? Roles Seed
            var roleSeeder = new RoleSeeder(_unitOfWork, _loggerFactory.CreateLogger<RoleSeeder>());

            await roleSeeder.SeedAsync(cancellationToken);
            _logger.LogInformation("Roles seeded successfully");

            if (_isDevelopment)
            {
                var developSeeder = new DevelopSeeder(
                    _unitOfWork,
                    _passwordHasher,
                    _loggerFactory.CreateLogger<DevelopSeeder>());

                await developSeeder.SeedAsync(cancellationToken);
                _logger.LogInformation("Development data seeded successfully");
            }
        }
        catch (Exception ex)
        {
            _logger.LogError("Error seeding database: {ErrorMessage}", ex.Message);
            throw;
        }
    }
}