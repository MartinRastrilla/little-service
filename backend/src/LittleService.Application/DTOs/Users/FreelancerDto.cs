namespace LittleService.Application.DTOs.Users;

public class FreelancerDto
{
    public Guid UserId { get; set; }
    public string? Bio { get; set; }
    public double RatingAverage { get; set; }
    public int RatingCount { get; set; }
    public int CompletedJobs { get; set; }
}