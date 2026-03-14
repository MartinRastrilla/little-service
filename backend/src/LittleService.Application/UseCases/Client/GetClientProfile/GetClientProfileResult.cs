using LittleService.Application.DTOs.Users;

namespace LittleService.Application.UseCases.Client.GetClientProfile;

public class GetClientProfileResult
{
    public UserDto User { get; set; } = new UserDto();
}
