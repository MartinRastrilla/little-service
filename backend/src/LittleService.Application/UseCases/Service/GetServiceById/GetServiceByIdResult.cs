using LittleService.Application.DTOs.Services;

namespace LittleService.Application.UseCases.Service.GetServiceById;

public class GetServiceByIdResult
{
    public ServiceDto Service { get; set; } = null!;
}
