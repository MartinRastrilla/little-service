class FreelancerReviewPreview {
  final String id;
  final String reviewerName;
  final String? reviewerProfilePictureUrl;
  final int rating;
  final String? comment;
  final String serviceRequestTitle;
  final DateTime createdAt;

  const FreelancerReviewPreview({
    required this.id,
    required this.reviewerName,
    this.reviewerProfilePictureUrl,
    required this.rating,
    this.comment,
    required this.serviceRequestTitle,
    required this.createdAt,
  });
}

class FreelancerServicePreview {
  final String id;
  final String title;
  final String description;
  final num price;

  const FreelancerServicePreview({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });
}

class FreelancerPublicProfile {
  final String freelancerId;
  final String fullName;
  final String? profilePictureUrl;
  final String? profession;
  final String? bio;
  final bool isVerified;
  final DateTime memberSince;
  final int yearsOnPlatform;
  final double averageRating;
  final int totalReviewsCount;
  final int completedJobs;
  final bool hasReports;
  final List<String> skills;
  final int totalActiveServicesCount;
  final List<FreelancerServicePreview> offeredServices;
  final List<FreelancerReviewPreview> recentReviews;

  const FreelancerPublicProfile({
    required this.freelancerId,
    required this.fullName,
    this.profilePictureUrl,
    this.profession,
    this.bio,
    required this.isVerified,
    required this.memberSince,
    required this.yearsOnPlatform,
    required this.averageRating,
    required this.totalReviewsCount,
    required this.completedJobs,
    required this.hasReports,
    required this.skills,
    required this.totalActiveServicesCount,
    required this.offeredServices,
    required this.recentReviews,
  });
}
