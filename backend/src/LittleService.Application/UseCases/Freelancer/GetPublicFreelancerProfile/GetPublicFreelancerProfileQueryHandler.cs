using LittleService.Application.Common;
using LittleService.Application.DTOs.Freelancers;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Freelancer.GetPublicFreelancerProfile;

public class GetPublicFreelancerProfileQueryHandler
    : IRequestHandler<GetPublicFreelancerProfileQuery, Result<GetPublicFreelancerProfileResult>>
{
    private const int RecentReviewsLimit = 2;
    private const int OfferedServicesLimit = 2;

    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<GetPublicFreelancerProfileQueryHandler> _logger;

    public GetPublicFreelancerProfileQueryHandler(
        IUnitOfWork unitOfWork,
        IFileStorageService fileStorageService,
        ILogger<GetPublicFreelancerProfileQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<GetPublicFreelancerProfileResult>> Handle(
        GetPublicFreelancerProfileQuery query,
        CancellationToken cancellationToken)
    {
        var viewer = await _unitOfWork.Users.GetByIdAsync(query.ViewerUserId, cancellationToken);
        if (viewer == null)
            return Result<GetPublicFreelancerProfileResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (viewer.Client == null)
            return Result<GetPublicFreelancerProfileResult>.Failure(
                "Perfil de cliente no encontrado",
                "CLIENT_NOT_FOUND");

        var freelancerUser = await _unitOfWork.Users.GetByIdAsync(query.FreelancerId, cancellationToken);
        if (freelancerUser == null || freelancerUser.Freelancer == null)
            return Result<GetPublicFreelancerProfileResult>.Failure(
                "Perfil de freelancer no encontrado",
                "FREELANCER_NOT_FOUND");

        var reportCount = await _unitOfWork.Reports.GetReportCountByReportedUserIdAsync(
            query.FreelancerId,
            cancellationToken);
        var recentReviewsReadModels = await _unitOfWork.Ratings.GetRecentActiveReviewsAsync(
            query.FreelancerId,
            RatingReceiverRole.Freelancer,
            RecentReviewsLimit,
            cancellationToken);
        var offeredServicesSummaries = await _unitOfWork.Services.GetActiveSummariesByFreelancerIdAsync(
            query.FreelancerId,
            OfferedServicesLimit,
            cancellationToken);
        var totalActiveServicesCount = await _unitOfWork.Services.CountActiveByFreelancerIdAsync(
            query.FreelancerId,
            cancellationToken);
        var skills = await _unitOfWork.Users.GetSkillNamesByFreelancerIdAsync(
            query.FreelancerId,
            cancellationToken);

        var profilePictureUrl = freelancerUser.ProfilePictureUrl != null
            ? _fileStorageService.GetFileUrl(freelancerUser.ProfilePictureUrl)
            : null;

        var recentReviews = recentReviewsReadModels
            .Select(review => new FreelancerReviewPreviewDto
            {
                Id = review.Id,
                ReviewerName = review.ReviewerName,
                ReviewerProfilePictureUrl = review.ReviewerProfilePictureUrl != null
                    ? _fileStorageService.GetFileUrl(review.ReviewerProfilePictureUrl)
                    : null,
                Rating = review.Rating,
                Comment = review.Comment,
                ServiceRequestTitle = review.ServiceRequestTitle,
                CreatedAt = review.CreatedAt
            })
            .ToList();

        var offeredServices = offeredServicesSummaries
            .Select(service => new FreelancerServicePreviewDto
            {
                Id = service.Id,
                Title = service.Title,
                Description = service.Description,
                Price = service.Price
            })
            .ToList();

        var profile = new FreelancerPublicProfileDto
        {
            FreelancerId = query.FreelancerId,
            FullName = freelancerUser.Name,
            ProfilePictureUrl = profilePictureUrl,
            Profession = freelancerUser.Freelancer.Profession,
            Bio = freelancerUser.Freelancer.Bio,
            // TODO(tech-debt): freelancer verification
            IsVerified = false,
            MemberSince = freelancerUser.CreatedAt,
            YearsOnPlatform = CalculateYearsOnPlatform(freelancerUser.CreatedAt),
            AverageRating = freelancerUser.Freelancer.RatingAverage,
            TotalReviewsCount = freelancerUser.Freelancer.RatingCount,
            CompletedJobs = freelancerUser.Freelancer.CompletedJobs,
            HasReports = reportCount > 0,
            Skills = skills,
            TotalActiveServicesCount = totalActiveServicesCount,
            OfferedServices = offeredServices,
            RecentReviews = recentReviews
        };

        return Result<GetPublicFreelancerProfileResult>.Success(new GetPublicFreelancerProfileResult
        {
            Profile = profile
        });
    }

    private static int CalculateYearsOnPlatform(DateTime memberSince)
    {
        var today = DateTime.UtcNow.Date;
        var joined = memberSince.Date;
        var years = today.Year - joined.Year;

        if (joined > today.AddYears(-years))
            years--;

        return Math.Max(years, 0);
    }
}
