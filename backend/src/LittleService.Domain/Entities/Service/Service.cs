namespace LittleService.Domain.Entities;

public class Service : BaseEntity
{
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public decimal Price { get; set; }
    public bool IsActive { get; set; } = true;

    /* === Relationships === */
    public Guid FreelancerId { get; set; }
    public Freelancer? Freelancer { get; set; }
}