namespace LittleService.Domain.Entities;

public class User
{
    public Guid Id { get; set; } = Guid.NewGuid();

    public string Name { get; set; } = string.Empty;

    public string Email { get; set; } = string.Empty;

    public string Password { get; set; } = string.Empty;

    public string? ProfilePictureUrl { get; set; }

    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }

    /* === Relationships === */
    public ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();
    public Freelancer? Freelancer { get; set; }
    public Client? Client { get; set; }
}