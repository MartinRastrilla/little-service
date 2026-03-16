using Microsoft.AspNetCore.Http;

namespace LittleService.Api.Models;

public class UpdateClientProfileFormDto
{
    public string? Name { get; set; }
    public string? Address { get; set; }
    public IFormFile? ProfilePicture { get; set; }
}
