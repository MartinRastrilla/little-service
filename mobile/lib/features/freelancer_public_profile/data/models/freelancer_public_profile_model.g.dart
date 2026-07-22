// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelancer_public_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FreelancerReviewPreviewModel _$FreelancerReviewPreviewModelFromJson(
  Map<String, dynamic> json,
) => _FreelancerReviewPreviewModel(
  id: stringFromJson(json['id']),
  reviewerName: json['reviewerName'] as String,
  reviewerProfilePictureUrl: json['reviewerProfilePictureUrl'] as String?,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String?,
  serviceRequestTitle: json['serviceRequestTitle'] as String,
  createdAt: dateTimeFromJson(json['createdAt']),
);

Map<String, dynamic> _$FreelancerReviewPreviewModelToJson(
  _FreelancerReviewPreviewModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'reviewerName': instance.reviewerName,
  'reviewerProfilePictureUrl': instance.reviewerProfilePictureUrl,
  'rating': instance.rating,
  'comment': instance.comment,
  'serviceRequestTitle': instance.serviceRequestTitle,
  'createdAt': dateTimeToJson(instance.createdAt),
};

_FreelancerServicePreviewModel _$FreelancerServicePreviewModelFromJson(
  Map<String, dynamic> json,
) => _FreelancerServicePreviewModel(
  id: stringFromJson(json['id']),
  title: json['title'] as String,
  description: json['description'] as String,
  price: json['price'] as num,
);

Map<String, dynamic> _$FreelancerServicePreviewModelToJson(
  _FreelancerServicePreviewModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'price': instance.price,
};

_FreelancerPublicProfileModel _$FreelancerPublicProfileModelFromJson(
  Map<String, dynamic> json,
) => _FreelancerPublicProfileModel(
  freelancerId: stringFromJson(json['freelancerId']),
  fullName: json['fullName'] as String,
  profilePictureUrl: json['profilePictureUrl'] as String?,
  profession: json['profession'] as String?,
  bio: json['bio'] as String?,
  isVerified: json['isVerified'] as bool? ?? false,
  memberSince: dateTimeFromJson(json['memberSince']),
  yearsOnPlatform: (json['yearsOnPlatform'] as num?)?.toInt() ?? 0,
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
  totalReviewsCount: (json['totalReviewsCount'] as num?)?.toInt() ?? 0,
  completedJobs: (json['completedJobs'] as num?)?.toInt() ?? 0,
  hasReports: json['hasReports'] as bool? ?? false,
  skills:
      (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  totalActiveServicesCount:
      (json['totalActiveServicesCount'] as num?)?.toInt() ?? 0,
  offeredServices:
      (json['offeredServices'] as List<dynamic>?)
          ?.map(
            (e) => FreelancerServicePreviewModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  recentReviews:
      (json['recentReviews'] as List<dynamic>?)
          ?.map(
            (e) => FreelancerReviewPreviewModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$FreelancerPublicProfileModelToJson(
  _FreelancerPublicProfileModel instance,
) => <String, dynamic>{
  'freelancerId': instance.freelancerId,
  'fullName': instance.fullName,
  'profilePictureUrl': instance.profilePictureUrl,
  'profession': instance.profession,
  'bio': instance.bio,
  'isVerified': instance.isVerified,
  'memberSince': dateTimeToJson(instance.memberSince),
  'yearsOnPlatform': instance.yearsOnPlatform,
  'averageRating': instance.averageRating,
  'totalReviewsCount': instance.totalReviewsCount,
  'completedJobs': instance.completedJobs,
  'hasReports': instance.hasReports,
  'skills': instance.skills,
  'totalActiveServicesCount': instance.totalActiveServicesCount,
  'offeredServices': instance.offeredServices,
  'recentReviews': instance.recentReviews,
};
