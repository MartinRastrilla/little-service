using LittleService.Application.DTOs;
using LittleService.Application.Interfaces;
using LittleService.Application.Mappings;
using LittleService.Infrastructure.Repositories;

namespace LittleService.Application.Interfaces;

public class ServiceService : IServiceService
{
    private readonly IServiceRepository _serviceRepository;

    public ServiceService(IServiceRepository serviceRepository)
    {
        _serviceRepository = serviceRepository;
    }

    public async Task<IEnumerable<ServiceResponseDto>> GetAllServicesAsync()
    {
        var services = await _serviceRepository.GetAllAsync();
        return services.Select(ServiceMapper.ToDto);
    }

    public async Task<ServiceResponseDto?> GetServiceByIdAsync(Guid id)
    {
        var service = await _serviceRepository.GetByIdAsync(id);
        return service is null ? null : ServiceMapper.ToDto(service);
    }

    public async Task<ServiceResponseDto> CreateServiceAsync(CreateServiceDto createServiceDto, Guid userId)
    {
        var service = ServiceMapper.ToEntity(createServiceDto, userId);
        var created = await _serviceRepository.AddAsync(service);
        return ServiceMapper.ToDto(created);
    }

    public async Task<ServiceResponseDto?> UpdateServiceAsync(Guid id, UpdateServiceDto updateServiceDto)
    {
        var service = await _serviceRepository.GetByIdAsync(id);
        if (service is null)
        {
            return null;
        }
        ServiceMapper.UpdateEntity(updateServiceDto, service);
        await _serviceRepository.UpdateAsync(service);
        return ServiceMapper.ToDto(service);
    }

    public async Task<bool> DeleteServiceAsync(Guid id)
    {
        var service = await _serviceRepository.GetByIdAsync(id);
        if (service is null)
        {
            return false;
        }
        await _serviceRepository.DeleteAsync(id);
        return true;
    }
}