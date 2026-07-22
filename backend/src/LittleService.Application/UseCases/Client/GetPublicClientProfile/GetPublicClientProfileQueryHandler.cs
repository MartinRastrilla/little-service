using LittleService.Application.Common;
using LittleService.Application.DTOs.Clients;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Client.GetPublicClientProfile;

public class GetPublicClientProfileQueryHandler
    : IRequestHandler<GetPublicClientProfileQuery, Result<GetPublicClientProfileResult>>
{
    private const int RecentReviewsLimit = 2;

    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<GetPublicClientProfileQueryHandler> _logger;

    public GetPublicClientProfileQueryHandler(
        IUnitOfWork unitOfWork,
        IFileStorageService fileStorageService,
        ILogger<GetPublicClientProfileQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<GetPublicClientProfileResult>> Handle(
        GetPublicClientProfileQuery query,
        CancellationToken cancellationToken)
    {
        var viewer = await _unitOfWork.Users.GetByIdAsync(query.ViewerUserId, cancellationToken);
        if (viewer == null)
            return Result<GetPublicClientProfileResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (viewer.Freelancer == null)
            return Result<GetPublicClientProfileResult>.Failure(
                "Perfil de freelancer no encontrado",
                "FREELANCER_NOT_FOUND");

        var clientUser = await _unitOfWork.Users.GetByIdAsync(query.ClientId, cancellationToken);
        if (clientUser == null || clientUser.Client == null)
            return Result<GetPublicClientProfileResult>.Failure(
                "Perfil de cliente no encontrado",
                "CLIENT_NOT_FOUND");

        var publishedJobsCount = await _unitOfWork.ServiceRequests.CountByClientIdExcludingCancelledAsync(
            query.ClientId,
            cancellationToken);
        var averageRating = await _unitOfWork.Ratings.GetAverageRatingByUserRevieweeIdAsync(
            query.ClientId,
            RatingReceiverRole.Client,
            cancellationToken);
        var totalReviewsCount = await _unitOfWork.Ratings.GetRatingCountByUserRevieweeIdAsync(
            query.ClientId,
            RatingReceiverRole.Client,
            cancellationToken);
        var recentReviewsReadModels = await _unitOfWork.Ratings.GetRecentActiveReviewsAsync(
            query.ClientId,
            RatingReceiverRole.Client,
            RecentReviewsLimit,
            cancellationToken);
        var reportCount = await _unitOfWork.Reports.GetReportCountByReportedUserIdAsync(
            query.ClientId,
            cancellationToken);

        var location = clientUser.Client.HasAddress() ? clientUser.Client.Address : null;
        var profilePictureUrl = clientUser.ProfilePictureUrl != null
            ? _fileStorageService.GetFileUrl(clientUser.ProfilePictureUrl)
            : null;

        var recentReviews = recentReviewsReadModels
            .Select(review => new ClientReviewPreviewDto
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

        var profile = new ClientPublicProfileDto
        {
            ClientId = query.ClientId,
            FullName = clientUser.Name,
            ProfilePictureUrl = profilePictureUrl,
            // TODO(tech-debt): account verification
            IsVerified = false,
            // TODO(tech-debt): email verification
            IsEmailVerified = false,
            MemberSince = clientUser.CreatedAt,
            AverageRating = Math.Round(averageRating, 2),
            TotalReviewsCount = totalReviewsCount,
            PublishedJobsCount = publishedJobsCount,
            Location = location,
            HasReports = reportCount > 0,
            RecentReviews = recentReviews
        };

        return Result<GetPublicClientProfileResult>.Success(new GetPublicClientProfileResult
        {
            Profile = profile
        });
    }
}
