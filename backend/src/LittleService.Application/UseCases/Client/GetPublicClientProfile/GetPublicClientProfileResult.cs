using LittleService.Application.DTOs.Clients;

namespace LittleService.Application.UseCases.Client.GetPublicClientProfile;

public class GetPublicClientProfileResult
{
    public ClientPublicProfileDto Profile { get; set; } = new();
}
