using LittleService.Application.DTOs;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public class ServiceMapper
{
    public static ServiceResponseDto ToDto(Service service)
    {
        return new ServiceResponseDto
        {
            Id = service.Id,
            Title = service.Title,
            Description = service.Description,
            Price = service.Price,
            IsActive = service.IsActive,
            CreatedAt = service.CreatedAt,
            UpdatedAt = service.UpdatedAt,
            UserId = service.FreelancerId,
        };
    }

    public static Service ToEntity(CreateServiceDto createServiceDto, Guid userId)
    {
        return new Service
        {
            Title = createServiceDto.Title,
            Description = createServiceDto.Description,
            Price = createServiceDto.Price,
            FreelancerId = userId
        };
    }

    public static void UpdateEntity(UpdateServiceDto updateServiceDto, Service service)
    {
        bool hasChanges = false;

        if (!string.IsNullOrEmpty(updateServiceDto.Title))
        {
            service.Title = updateServiceDto.Title;
            hasChanges = true;
        }

        if (!string.IsNullOrEmpty(updateServiceDto.Description))
        {
            service.Description = updateServiceDto.Description;
            hasChanges = true;
        }

        if (updateServiceDto.Price.HasValue)
        {
            service.Price = updateServiceDto.Price.Value;
            hasChanges = true;
        }

        // Solo actualizar UpdatedAt si realmente hubo cambios
        if (hasChanges)
        {
            service.UpdatedAt = DateTime.UtcNow;
        }
    }
}