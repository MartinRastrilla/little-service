using LittleService.Application.DTOs.Services;

namespace LittleService.Application.UseCases.Service.CreateService;

public class CreateServiceResult
{
    public ServiceDto Service { get; set; } = null!;
}
