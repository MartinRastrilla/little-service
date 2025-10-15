using LittleService.Application.DTOs;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public class FreelancerMapper
{
    public static FreelancerDto ToDto(Freelancer freelancer)
    {
        return new FreelancerDto
        {
            Id = freelancer.UserId,
            Bio = freelancer.Bio,
            RatingAverage = freelancer.RatingAverage,
            RatingCount = freelancer.RatingCount,
            CompletedJobs = freelancer.CompletedJobs,
            Services = freelancer.Services.Select(ServiceMapper.ToDto).ToList(),
        };
    }

    public static Freelancer ToEntity(FreelancerDto freelancerDto, Guid userId)
    {
        return new Freelancer
        {
            UserId = userId,
            Bio = freelancerDto.Bio,
            RatingAverage = freelancerDto.RatingAverage,
            RatingCount = freelancerDto.RatingCount,
            CompletedJobs = freelancerDto.CompletedJobs,
            Services = freelancerDto.Services.Select(sr => new Service
            {
                Id = sr.Id,
                Title = sr.Title,
                Description = sr.Description,
                Price = sr.Price,
                IsActive = sr.IsActive,
                CreatedAt = sr.CreatedAt,
                UpdatedAt = sr.UpdatedAt,
                FreelancerId = userId,
            }).ToList(),
        };
    }

    public static Freelancer ToEntityFromCreate(CreateFreelancerDto createFreelancerDto, Guid userId)
    {
        return new Freelancer
        {
            UserId = userId,
            Bio = createFreelancerDto.Bio,
            RatingAverage = 0,
            RatingCount = 0,
            CompletedJobs = 0,
            Services = new List<Service>(),
        };
    }

    public static void UpdateEntity(UpdateFreelancerDto updateFreelancerDto, Freelancer freelancer)
    {
        if (!string.IsNullOrEmpty(updateFreelancerDto.Bio))
        {
            freelancer.Bio = updateFreelancerDto.Bio;
        }
    }

}