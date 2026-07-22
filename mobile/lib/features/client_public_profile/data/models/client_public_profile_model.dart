import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';

part 'client_public_profile_model.freezed.dart';
part 'client_public_profile_model.g.dart';

@freezed
abstract class ClientReviewPreviewModel with _$ClientReviewPreviewModel {
  const ClientReviewPreviewModel._();

  const factory ClientReviewPreviewModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String reviewerName,
    String? reviewerProfilePictureUrl,
    required int rating,
    String? comment,
    required String serviceRequestTitle,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _ClientReviewPreviewModel;

  factory ClientReviewPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$ClientReviewPreviewModelFromJson(json);

  ClientReviewPreview toEntity() => ClientReviewPreview(
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
abstract class ClientPublicProfileModel with _$ClientPublicProfileModel {
  const ClientPublicProfileModel._();

  const factory ClientPublicProfileModel({
    @JsonKey(fromJson: stringFromJson) required String clientId,
    required String fullName,
    String? profilePictureUrl,
    @Default(false) bool isVerified,
    @Default(false) bool isEmailVerified,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime memberSince,
    @Default(0) double averageRating,
    @Default(0) int totalReviewsCount,
    @Default(0) int publishedJobsCount,
    String? location,
    @Default(false) bool hasReports,
    @Default([]) List<ClientReviewPreviewModel> recentReviews,
  }) = _ClientPublicProfileModel;

  factory ClientPublicProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ClientPublicProfileModelFromJson(json);

  ClientPublicProfile toEntity() => ClientPublicProfile(
        clientId: clientId,
        fullName: fullName,
        profilePictureUrl: profilePictureUrl,
        isVerified: isVerified,
        isEmailVerified: isEmailVerified,
        memberSince: memberSince,
        averageRating: averageRating,
        totalReviewsCount: totalReviewsCount,
        publishedJobsCount: publishedJobsCount,
        location: location,
        hasReports: hasReports,
        recentReviews: recentReviews.map((review) => review.toEntity()).toList(),
      );
}
