using System.ComponentModel.DataAnnotations;

namespace LittleService.Domain.Entities;

public class User
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();

    [Required]
    [MaxLength(200)]
    public string Name { get; set; } = string.Empty;

    [Required]
    [EmailAddress]
    [MaxLength(100)]
    public string Email { get; set; } = string.Empty;

    [Required]
    [MinLength(8)]
    [MaxLength(255)]
    public string Password { get; set; } = string.Empty;

    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }

    /* === Relationships === */
    public ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();
    public Freelancer? Freelancer { get; set; }
    public Client? Client { get; set; }
}