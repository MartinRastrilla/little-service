using System.ComponentModel.DataAnnotations;

namespace LittleService.Domain.Entities;

public class Role
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();

    [Required]
    [MaxLength(200)]
    public string Name { get; set; } = string.Empty;

    [Required]
    [MaxLength(200)]
    public string Description { get; set; } = string.Empty;
    
    /* === Relationships === */
    public ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();
}