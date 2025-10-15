using LittleService.Application.DTOs;

namespace LittleService.Application.Interfaces;

public interface IServiceService
{
    Task<IEnumerable<ServiceResponseDto>> GetAllServicesAsync();
    Task<ServiceResponseDto?> GetServiceByIdAsync(Guid id);
    Task<ServiceResponseDto> CreateServiceAsync(CreateServiceDto createServiceDto, Guid userId);
    Task<ServiceResponseDto?> UpdateServiceAsync(Guid id, UpdateServiceDto updateServiceDto);
    Task<bool> DeleteServiceAsync(Guid id);
}