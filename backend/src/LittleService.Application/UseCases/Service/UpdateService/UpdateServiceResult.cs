using LittleService.Application.DTOs.Services;

namespace LittleService.Application.UseCases.Service.UpdateService;

public class UpdateServiceResult
{
    public ServiceDto Service { get; set; } = null!;
}
