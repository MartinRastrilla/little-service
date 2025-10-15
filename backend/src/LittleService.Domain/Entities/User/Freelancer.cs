using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LittleService.Domain.Entities;

public class Freelancer
{
    [Key, ForeignKey("User")]
    public Guid UserId { get; set; }
    public User User { get; set; } = null!;

    [MaxLength(2500)]
    public string? Bio { get; set; }

    public double RatingAverage { get; set; }
    public int RatingCount { get; set; }
    public int CompletedJobs { get; set; }

    /* === Relationships === */
    public ICollection<Service> Services { get; set; } = new List<Service>();
}