class ClientReviewPreview {
  final String id;
  final String reviewerName;
  final String? reviewerProfilePictureUrl;
  final int rating;
  final String? comment;
  final String serviceRequestTitle;
  final DateTime createdAt;

  const ClientReviewPreview({
    required this.id,
    required this.reviewerName,
    this.reviewerProfilePictureUrl,
    required this.rating,
    this.comment,
    required this.serviceRequestTitle,
    required this.createdAt,
  });
}

class ClientPublicProfile {
  final String clientId;
  final String fullName;
  final String? profilePictureUrl;
  final bool isVerified;
  final bool isEmailVerified;
  final DateTime memberSince;
  final double averageRating;
  final int totalReviewsCount;
  final int publishedJobsCount;
  final String? location;
  final bool hasReports;
  final List<ClientReviewPreview> recentReviews;

  const ClientPublicProfile({
    required this.clientId,
    required this.fullName,
    this.profilePictureUrl,
    required this.isVerified,
    required this.isEmailVerified,
    required this.memberSince,
    required this.averageRating,
    required this.totalReviewsCount,
    required this.publishedJobsCount,
    this.location,
    required this.hasReports,
    required this.recentReviews,
  });
}
