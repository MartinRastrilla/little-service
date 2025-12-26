namespace LittleService.Domain.Entities;

public class Client
{
    public Guid UserId { get; set; }
    public User User { get; set; } = null!;

    public int TotalContracts { get; set; }
}
