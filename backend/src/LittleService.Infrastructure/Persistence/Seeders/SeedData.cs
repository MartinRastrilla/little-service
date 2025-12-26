using LittleService.Domain.Entities;

namespace LittleService.Infrastructure.Persistence.Seeders;

/// <summary>
/// Contiene los datos iniciales para seedear la base de datos
/// </summary>
public static class SeedData
{
    public static IEnumerable<Role> GetDefaultRoles()
    {
        return new List<Role>
        {
            new Role
            {
                Id = Guid.Parse("11111111-1111-1111-1111-111111111111"),
                Name = "Admin",
                Description = "Persona que administra el sistema"
            },
            new Role
            {
                Id = Guid.Parse("11111111-2222-2222-2222-222222222222"),
                Name = "Moderator",
                Description = "Persona que revisa y aprueba los servicios"
            },
            new Role
            {
                Id = Guid.Parse("11111111-3333-3333-3333-333333333333"),
                Name = "Support",
                Description = "Persona que ayuda a los usuarios"
            },
            new Role
            {
                Id = Guid.Parse("22222222-2222-2222-2222-222222222222"),
                Name = "Freelancer",
                Description = "Persona que ofrece servicios"
            },
            new Role
            {
                Id = Guid.Parse("33333333-3333-3333-3333-333333333333"),
                Name = "Client",
                Description = "Persona que contrata servicios"
            }
        };
    }
}