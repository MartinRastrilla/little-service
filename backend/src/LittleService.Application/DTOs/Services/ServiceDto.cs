namespace LittleService.Application.DTOs.Services;

public class ServiceDto
{
    public Guid Id { get; set; }
    public Guid FreelancerId { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public decimal Price { get; set; }
    public bool IsActive { get; set; }
    public DateTime CreatedAt { get; set; }
}
