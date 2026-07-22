// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_public_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientReviewPreviewModel _$ClientReviewPreviewModelFromJson(
  Map<String, dynamic> json,
) => _ClientReviewPreviewModel(
  id: stringFromJson(json['id']),
  reviewerName: json['reviewerName'] as String,
  reviewerProfilePictureUrl: json['reviewerProfilePictureUrl'] as String?,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String?,
  serviceRequestTitle: json['serviceRequestTitle'] as String,
  createdAt: dateTimeFromJson(json['createdAt']),
);

Map<String, dynamic> _$ClientReviewPreviewModelToJson(
  _ClientReviewPreviewModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'reviewerName': instance.reviewerName,
  'reviewerProfilePictureUrl': instance.reviewerProfilePictureUrl,
  'rating': instance.rating,
  'comment': instance.comment,
  'serviceRequestTitle': instance.serviceRequestTitle,
  'createdAt': dateTimeToJson(instance.createdAt),
};

_ClientPublicProfileModel _$ClientPublicProfileModelFromJson(
  Map<String, dynamic> json,
) => _ClientPublicProfileModel(
  clientId: stringFromJson(json['clientId']),
  fullName: json['fullName'] as String,
  profilePictureUrl: json['profilePictureUrl'] as String?,
  isVerified: json['isVerified'] as bool? ?? false,
  isEmailVerified: json['isEmailVerified'] as bool? ?? false,
  memberSince: dateTimeFromJson(json['memberSince']),
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
  totalReviewsCount: (json['totalReviewsCount'] as num?)?.toInt() ?? 0,
  publishedJobsCount: (json['publishedJobsCount'] as num?)?.toInt() ?? 0,
  location: json['location'] as String?,
  hasReports: json['hasReports'] as bool? ?? false,
  recentReviews:
      (json['recentReviews'] as List<dynamic>?)
          ?.map(
            (e) => ClientReviewPreviewModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$ClientPublicProfileModelToJson(
  _ClientPublicProfileModel instance,
) => <String, dynamic>{
  'clientId': instance.clientId,
  'fullName': instance.fullName,
  'profilePictureUrl': instance.profilePictureUrl,
  'isVerified': instance.isVerified,
  'isEmailVerified': instance.isEmailVerified,
  'memberSince': dateTimeToJson(instance.memberSince),
  'averageRating': instance.averageRating,
  'totalReviewsCount': instance.totalReviewsCount,
  'publishedJobsCount': instance.publishedJobsCount,
  'location': instance.location,
  'hasReports': instance.hasReports,
  'recentReviews': instance.recentReviews,
};
