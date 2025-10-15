using LittleService.Application.DTOs;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public class ClientMapper
{
    public static ClientDto ToDto(Client client)
    {
        return new ClientDto
        {
            Id = client.UserId,
            UserId = client.UserId,
            TotalContracts = client.TotalContracts
        };
    }

    public static Client ToEntity(CreateClientDto dto, Guid userId)
    {
        return new Client
        {
            UserId = userId,
            TotalContracts = 0
        };
    }

    public static void UpdateEntity(UpdateClientDto dto, Client client)
    {
        if (dto.TotalContracts.HasValue)
        {
            client.TotalContracts = dto.TotalContracts;
        }
    }
}