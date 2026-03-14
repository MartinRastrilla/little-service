using LittleService.Application.DTOs.Services;

namespace LittleService.Application.UseCases.Service.GetMyServices;

public class GetMyServicesResult
{
    public IList<ServiceDto> Services { get; set; } = new List<ServiceDto>();
}
