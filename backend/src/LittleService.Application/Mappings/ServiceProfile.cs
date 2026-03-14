using AutoMapper;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.DTOs.Services;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappings;

public class ServiceProfile : Profile
{
    public ServiceProfile()
    {
        // Service → ServiceDto
        CreateMap<Service, ServiceDto>();

        // ServiceRequestPhoto → ServiceRequestPhotoDto
        CreateMap<ServiceRequestPhoto, ServiceRequestPhotoDto>();

        // ServiceRequest → ServiceRequestSummaryDto
        CreateMap<ServiceRequest, ServiceRequestSummaryDto>()
            .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status.ToString()))
            .ForMember(dest => dest.PhotosCount, opt => opt.MapFrom(src => src.Photos.Count));

        // ServiceRequest → ServiceRequestDetailDto
        CreateMap<ServiceRequest, ServiceRequestDetailDto>()
            .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status.ToString()))
            .ForMember(dest => dest.ApplicationsCount, opt => opt.MapFrom(src => src.FreelancerApplications.Count))
            .ForMember(dest => dest.Photos, opt => opt.MapFrom(src => src.Photos));

        // FreelancerApplication → FreelancerApplicationSummaryDto
        CreateMap<FreelancerApplication, FreelancerApplicationSummaryDto>()
            .ForMember(dest => dest.FreelancerName, opt => opt.MapFrom(src => src.Freelancer.User.Name))
            .ForMember(dest => dest.FreelancerProfilePicture, opt => opt.MapFrom(src => src.Freelancer.User.ProfilePictureUrl))
            .ForMember(dest => dest.RatingAverage, opt => opt.MapFrom(src => src.Freelancer.RatingAverage))
            .ForMember(dest => dest.RatingCount, opt => opt.MapFrom(src => src.Freelancer.RatingCount))
            .ForMember(dest => dest.Bio, opt => opt.MapFrom(src => src.Freelancer.Bio))
            .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status.ToString()));
    }
}
