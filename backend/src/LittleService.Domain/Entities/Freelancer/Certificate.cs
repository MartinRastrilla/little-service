namespace LittleService.Domain.Entities;

public class Certificate : BaseEntity
{
    public Guid FreelancerId { get; set; }
    public Freelancer Freelancer { get; set; } = null!;

    public string FilePath { get; set; } = null!;
    public string? Description { get; set; }
}