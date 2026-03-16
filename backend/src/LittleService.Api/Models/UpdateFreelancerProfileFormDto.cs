using Microsoft.AspNetCore.Http;

namespace LittleService.Api.Models;

public class UpdateFreelancerProfileFormDto
{
    public string? Name { get; set; }
    public string? Bio { get; set; }
    public string? Profession { get; set; }
    public IFormFile? ProfilePicture { get; set; }
}
