using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Queries;

namespace LittleService.Application.Mappers;

public class FreelancerWorkItemSummaryMapper
{
    private readonly IFileStorageService _fileStorageService;

    public FreelancerWorkItemSummaryMapper(IFileStorageService fileStorageService)
    {
        _fileStorageService = fileStorageService;
    }

    public FreelancerWorkItemSummaryDto MapApplication(FreelancerWorkItemSummaryReadModel summary)
    {
        var displayStatus = summary.ApplicationStatus.HasValue
            ? FreelancerApplicationDisplayStatusResolver.Resolve(summary.ApplicationStatus.Value)
            : string.Empty;

        return new FreelancerWorkItemSummaryDto
        {
            Id = summary.Id,
            Title = summary.Title,
            Location = summary.Location,
            Status = summary.Status.ToString(),
            DisplayStatus = displayStatus,
            Price = summary.Price,
            PriceMode = summary.Price.HasValue ? "Estimated" : "ToBeAgreed",
            PhotosCount = summary.PhotosCount,
            ApplicationsCount = summary.ApplicationsCount,
            CoverPhotoUrl = ResolveCoverPhotoUrl(summary.CoverPhotoPath),
            CreatedAt = summary.CreatedAt,
            ApplicationId = summary.ApplicationId,
            ApplicationStatus = summary.ApplicationStatus?.ToString(),
            ApplicationCreatedAt = summary.ApplicationCreatedAt,
            CanViewApplicationDetail =
                summary.ApplicationStatus == FreelancerApplicationStatus.Pending &&
                summary.Status == ServiceRequestStatus.Opened,
        };
    }

    public FreelancerWorkItemSummaryDto MapJob(FreelancerWorkItemSummaryReadModel summary)
    {
        var displayStatus = FreelancerJobDisplayStatusResolver.Resolve(
            summary.Status,
            summary.ContractStatus);

        return new FreelancerWorkItemSummaryDto
        {
            Id = summary.Id,
            Title = summary.Title,
            Location = summary.Location,
            Status = summary.Status.ToString(),
            DisplayStatus = displayStatus,
            Price = summary.Price,
            PriceMode = summary.Price.HasValue ? "Estimated" : "ToBeAgreed",
            PhotosCount = summary.PhotosCount,
            ApplicationsCount = summary.ApplicationsCount,
            CoverPhotoUrl = ResolveCoverPhotoUrl(summary.CoverPhotoPath),
            CreatedAt = summary.CreatedAt,
            ClientName = summary.ClientName,
            ContractAmount = summary.ContractAmount,
            ContractStartDate = summary.ContractStartDate,
            HasContract = summary.HasContract,
            UnreadMessagesCount = summary.UnreadMessagesCount,
        };
    }

    public IList<FreelancerWorkItemSummaryDto> MapApplications(
        IEnumerable<FreelancerWorkItemSummaryReadModel> summaries)
    {
        return summaries.Select(MapApplication).ToList();
    }

    public IList<FreelancerWorkItemSummaryDto> MapJobs(
        IEnumerable<FreelancerWorkItemSummaryReadModel> summaries)
    {
        return summaries.Select(MapJob).ToList();
    }

    private string? ResolveCoverPhotoUrl(string? coverPhotoPath)
    {
        return coverPhotoPath != null
            ? _fileStorageService.GetFileUrl(coverPhotoPath)
            : null;
    }
}
