using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Queries;

namespace LittleService.Application.Mappers;

public class ServiceRequestSummaryMapper
{
    private readonly IFileStorageService _fileStorageService;

    public ServiceRequestSummaryMapper(IFileStorageService fileStorageService)
    {
        _fileStorageService = fileStorageService;
    }

    public ServiceRequestSummaryDto Map(ServiceRequestSummaryReadModel summary)
    {
        var displayStatus = ServiceRequestDisplayStatusResolver.Resolve(
            summary.Status,
            summary.FreelancerPickedId,
            summary.ContractStatus);

        return new ServiceRequestSummaryDto
        {
            Id = summary.Id,
            Title = summary.Title,
            Description = summary.Description,
            Location = summary.Location,
            Status = summary.Status.ToString(),
            DisplayStatus = displayStatus,
            Price = summary.Price,
            ClientId = summary.ClientId,
            FreelancerPickedId = summary.FreelancerPickedId,
            PhotosCount = summary.PhotosCount,
            ContractStatus = summary.ContractStatus?.ToString(),
            CoverPhotoUrl = summary.CoverPhotoPath != null
                ? _fileStorageService.GetFileUrl(summary.CoverPhotoPath)
                : null,
            CreatedAt = summary.CreatedAt,
            ApplicationsCount = summary.ApplicationsCount
        };
    }

    public IList<ServiceRequestSummaryDto> MapMany(IEnumerable<ServiceRequestSummaryReadModel> summaries)
    {
        return summaries.Select(Map).ToList();
    }
}
