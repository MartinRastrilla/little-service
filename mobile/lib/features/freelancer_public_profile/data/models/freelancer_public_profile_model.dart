import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';

part 'freelancer_public_profile_model.freezed.dart';
part 'freelancer_public_profile_model.g.dart';

@freezed
abstract class FreelancerReviewPreviewModel with _$FreelancerReviewPreviewModel {
  const FreelancerReviewPreviewModel._();

  const factory FreelancerReviewPreviewModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String reviewerName,
    String? reviewerProfilePictureUrl,
    required int rating,
    String? comment,
    required String serviceRequestTitle,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _FreelancerReviewPreviewModel;

  factory FreelancerReviewPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$FreelancerReviewPreviewModelFromJson(json);

  FreelancerReviewPreview toEntity() => FreelancerReviewPreview(
        id: id,
        reviewerName: reviewerName,
        reviewerProfilePictureUrl: reviewerProfilePictureUrl,
        rating: rating,
        comment: comment,
        serviceRequestTitle: serviceRequestTitle,
        createdAt: createdAt,
      );
}

@freezed
abstract class FreelancerServicePreviewModel with _$FreelancerServicePreviewModel {
  const FreelancerServicePreviewModel._();

  const factory FreelancerServicePreviewModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String title,
    required String description,
    required num price,
  }) = _FreelancerServicePreviewModel;

  factory FreelancerServicePreviewModel.fromJson(Map<String, dynamic> json) =>
      _$FreelancerServicePreviewModelFromJson(json);

  FreelancerServicePreview toEntity() => FreelancerServicePreview(
        id: id,
        title: title,
        description: description,
        price: price,
      );
}

@freezed
abstract class FreelancerPublicProfileModel with _$FreelancerPublicProfileModel {
  const FreelancerPublicProfileModel._();

  const factory FreelancerPublicProfileModel({
    @JsonKey(fromJson: stringFromJson) required String freelancerId,
    required String fullName,
    String? profilePictureUrl,
    String? profession,
    String? bio,
    @Default(false) bool isVerified,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime memberSince,
    @Default(0) int yearsOnPlatform,
    @Default(0) double averageRating,
    @Default(0) int totalReviewsCount,
    @Default(0) int completedJobs,
    @Default(false) bool hasReports,
    @Default([]) List<String> skills,
    @Default(0) int totalActiveServicesCount,
    @Default([]) List<FreelancerServicePreviewModel> offeredServices,
    @Default([]) List<FreelancerReviewPreviewModel> recentReviews,
  }) = _FreelancerPublicProfileModel;

  factory FreelancerPublicProfileModel.fromJson(Map<String, dynamic> json) =>
      _$FreelancerPublicProfileModelFromJson(json);

  FreelancerPublicProfile toEntity() => FreelancerPublicProfile(
        freelancerId: freelancerId,
        fullName: fullName,
        profilePictureUrl: profilePictureUrl,
        profession: profession,
        bio: bio,
        isVerified: isVerified,
        memberSince: memberSince,
        yearsOnPlatform: yearsOnPlatform,
        averageRating: averageRating,
        totalReviewsCount: totalReviewsCount,
        completedJobs: completedJobs,
        hasReports: hasReports,
        skills: skills,
        totalActiveServicesCount: totalActiveServicesCount,
        offeredServices:
            offeredServices.map((service) => service.toEntity()).toList(),
        recentReviews:
            recentReviews.map((review) => review.toEntity()).toList(),
      );
}
