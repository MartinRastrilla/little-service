using LittleService.Application.DTOs.Users;

namespace LittleService.Application.UseCases.Client.UpdateClient;

public class UpdateClientResult
{
    public UserDto User { get; set; } = new UserDto();
}
