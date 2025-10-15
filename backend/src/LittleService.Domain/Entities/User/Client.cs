using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LittleService.Domain.Entities;

public class Client
{
    [Key, ForeignKey("User")]
    public Guid UserId { get; set; }
    public User User { get; set; } = null!;

    public int? TotalContracts { get; set; }
}
