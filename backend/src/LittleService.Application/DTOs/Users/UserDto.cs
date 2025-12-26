namespace LittleService.Application.DTOs.Users;

public class UserDto
{
    public Guid Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string? ProfilePictureUrl { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public List<RoleDto> Roles { get; set; } = new();
    public FreelancerDto? Freelancer { get; set; }
    public ClientDto? Client { get; set; }
}