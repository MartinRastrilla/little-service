namespace LittleService.Domain.Entities;

public class Freelancer
{
    public Guid UserId { get; set; }
    public User User { get; set; } = null!;

    public string? Bio { get; set; }

    public double RatingAverage { get; set; }
    public int RatingCount { get; set; }
    public int CompletedJobs { get; set; }

    /* === Relationships === */
    public ICollection<Service> Services { get; set; } = new List<Service>();
}