namespace LittleService.Application.DTOs;

public class FreelancerDto
{
    public Guid Id { get; set; }
    public string? Bio { get; set; }
    public double RatingAverage { get; set; }
    public int RatingCount { get; set; }
    public int CompletedJobs { get; set; }
    public List<ServiceResponseDto> Services { get; set; } = [];
}

public class CreateFreelancerDto
{
    public string? Bio { get; set; }
}

public class UpdateFreelancerDto
{
    public string? Bio { get; set; }
}