namespace LittleService.Application.DTOs.Users;

public class ClientDto
{
    public Guid UserId { get; set; }
    public string? Address { get; set; }
    public int TotalContracts { get; set; }
}