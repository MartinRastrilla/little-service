// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRequestTimelineStepModel _$ServiceRequestTimelineStepModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestTimelineStepModel(
  key: json['key'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  status: json['status'] as String,
  occurredAt: _nullableDateTimeFromJson(json['occurredAt']),
);

Map<String, dynamic> _$ServiceRequestTimelineStepModelToJson(
  _ServiceRequestTimelineStepModel instance,
) => <String, dynamic>{
  'key': instance.key,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'status': instance.status,
  'occurredAt': _nullableDateTimeToJson(instance.occurredAt),
};

_ServiceRequestRecentApplicationModel
_$ServiceRequestRecentApplicationModelFromJson(Map<String, dynamic> json) =>
    _ServiceRequestRecentApplicationModel(
      id: stringFromJson(json['id']),
      freelancerId: stringFromJson(json['freelancerId']),
      freelancerName: json['freelancerName'] as String,
      freelancerProfilePicture: json['freelancerProfilePicture'] as String?,
      ratingAverage: (json['ratingAverage'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      createdAt: dateTimeFromJson(json['createdAt']),
    );

Map<String, dynamic> _$ServiceRequestRecentApplicationModelToJson(
  _ServiceRequestRecentApplicationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'freelancerId': instance.freelancerId,
  'freelancerName': instance.freelancerName,
  'freelancerProfilePicture': instance.freelancerProfilePicture,
  'ratingAverage': instance.ratingAverage,
  'ratingCount': instance.ratingCount,
  'createdAt': dateTimeToJson(instance.createdAt),
};

_ServiceRequestActivityModel _$ServiceRequestActivityModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestActivityModel(
  messagesCount: (json['messagesCount'] as num?)?.toInt() ?? 0,
  applicationsCount: (json['applicationsCount'] as num?)?.toInt() ?? 0,
  showRecentApplications: json['showRecentApplications'] as bool? ?? false,
  timeline:
      (json['timeline'] as List<dynamic>?)
          ?.map(
            (e) => ServiceRequestTimelineStepModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <ServiceRequestTimelineStepModel>[],
  recentApplications:
      (json['recentApplications'] as List<dynamic>?)
          ?.map(
            (e) => ServiceRequestRecentApplicationModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <ServiceRequestRecentApplicationModel>[],
);

Map<String, dynamic> _$ServiceRequestActivityModelToJson(
  _ServiceRequestActivityModel instance,
) => <String, dynamic>{
  'messagesCount': instance.messagesCount,
  'applicationsCount': instance.applicationsCount,
  'showRecentApplications': instance.showRecentApplications,
  'timeline': instance.timeline,
  'recentApplications': instance.recentApplications,
};
