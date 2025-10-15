using System.ComponentModel.DataAnnotations;

namespace LittleService.Domain.Entities;

public class UserRole
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();

    [Required]
    public Guid UserId { get; set; }
    public User User { get; set; } = null!;

    [Required]
    public Guid RoleId { get; set; }
    public Role Role { get; set; } = null!;
}