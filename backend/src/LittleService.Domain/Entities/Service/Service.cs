namespace LittleService.Domain.Entities;

public class Service
{
    public Guid Id { get; set; } = Guid.NewGuid();

    public string Title { get; set; } = string.Empty;

    public string Description { get; set; } = string.Empty;

    public decimal Price { get; set; }

    public bool IsActive { get; set; } = true;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }


    /* === Relationships === */
    public Guid FreelancerId { get; set; }
    public Freelancer? Freelancer { get; set; }
}