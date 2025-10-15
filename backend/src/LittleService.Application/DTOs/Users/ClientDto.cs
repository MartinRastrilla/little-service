namespace LittleService.Application.DTOs;

public class ClientDto
{
    public Guid Id { get; set; }
    public Guid UserId { get; set; }
    public int? TotalContracts { get; set; }
}

public class CreateClientDto
{
    // Actualmente vacío, pero preparado para futuras propiedades
}

public class UpdateClientDto
{
    public int? TotalContracts { get; set; }
}