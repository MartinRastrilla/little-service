// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRequestApplicationModel _$ServiceRequestApplicationModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestApplicationModel(
  id: stringFromJson(json['id']),
  freelancerId: stringFromJson(json['freelancerId']),
  freelancerName: json['freelancerName'] as String,
  freelancerProfilePicture: json['freelancerProfilePicture'] as String?,
  ratingAverage: (json['ratingAverage'] as num).toDouble(),
  ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
  bio: json['bio'] as String?,
  status: json['status'] as String,
  displayStatus: json['displayStatus'] as String? ?? '',
  createdAt: dateTimeFromJson(json['createdAt']),
);

Map<String, dynamic> _$ServiceRequestApplicationModelToJson(
  _ServiceRequestApplicationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'freelancerId': instance.freelancerId,
  'freelancerName': instance.freelancerName,
  'freelancerProfilePicture': instance.freelancerProfilePicture,
  'ratingAverage': instance.ratingAverage,
  'ratingCount': instance.ratingCount,
  'bio': instance.bio,
  'status': instance.status,
  'displayStatus': instance.displayStatus,
  'createdAt': dateTimeToJson(instance.createdAt),
};

_ServiceRequestApplicationsResultModel
_$ServiceRequestApplicationsResultModelFromJson(Map<String, dynamic> json) =>
    _ServiceRequestApplicationsResultModel(
      applications:
          (json['applications'] as List<dynamic>?)
              ?.map(
                (e) => ServiceRequestApplicationModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const <ServiceRequestApplicationModel>[],
      canManageApplications: json['canManageApplications'] as bool? ?? false,
      serviceRequestTitle: json['serviceRequestTitle'] as String? ?? '',
      serviceRequestDisplayStatus:
          json['serviceRequestDisplayStatus'] as String? ?? '',
    );

Map<String, dynamic> _$ServiceRequestApplicationsResultModelToJson(
  _ServiceRequestApplicationsResultModel instance,
) => <String, dynamic>{
  'applications': instance.applications,
  'canManageApplications': instance.canManageApplications,
  'serviceRequestTitle': instance.serviceRequestTitle,
  'serviceRequestDisplayStatus': instance.serviceRequestDisplayStatus,
};
