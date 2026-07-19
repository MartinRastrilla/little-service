// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_service_request_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenServiceRequestClientSummaryModel
_$OpenServiceRequestClientSummaryModelFromJson(Map<String, dynamic> json) =>
    _OpenServiceRequestClientSummaryModel(
      clientId: stringFromJson(json['clientId']),
      clientName: json['clientName'] as String,
      clientProfilePictureUrl: json['clientProfilePictureUrl'] as String?,
      ratingLabel: json['ratingLabel'] as String,
      publishedJobsCount: (json['publishedJobsCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OpenServiceRequestClientSummaryModelToJson(
  _OpenServiceRequestClientSummaryModel instance,
) => <String, dynamic>{
  'clientId': instance.clientId,
  'clientName': instance.clientName,
  'clientProfilePictureUrl': instance.clientProfilePictureUrl,
  'ratingLabel': instance.ratingLabel,
  'publishedJobsCount': instance.publishedJobsCount,
};

_OpenServiceRequestDetailPhotoModel
_$OpenServiceRequestDetailPhotoModelFromJson(Map<String, dynamic> json) =>
    _OpenServiceRequestDetailPhotoModel(
      id: stringFromJson(json['id']),
      url: json['filePath'] as String,
    );

Map<String, dynamic> _$OpenServiceRequestDetailPhotoModelToJson(
  _OpenServiceRequestDetailPhotoModel instance,
) => <String, dynamic>{'id': instance.id, 'filePath': instance.url};

_OpenServiceRequestDetailModel _$OpenServiceRequestDetailModelFromJson(
  Map<String, dynamic> json,
) => _OpenServiceRequestDetailModel(
  id: stringFromJson(json['id']),
  title: json['title'] as String,
  description: json['description'] as String,
  location: json['location'] as String,
  status: json['status'] as String,
  displayStatus: json['displayStatus'] as String,
  price: (json['price'] as num?)?.toDouble(),
  priceMode: json['priceMode'] as String,
  photosCount: (json['photosCount'] as num?)?.toInt() ?? 0,
  applicationsCount: (json['applicationsCount'] as num?)?.toInt() ?? 0,
  photos:
      (json['photos'] as List<dynamic>?)
          ?.map(
            (e) => OpenServiceRequestDetailPhotoModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  createdAt: dateTimeFromJson(json['createdAt']),
  canApply: json['canApply'] as bool? ?? false,
  hasApplied: json['hasApplied'] as bool? ?? false,
  applicationStatus: json['applicationStatus'] as String?,
  applicationId: stringFromJson(json['applicationId']),
  client: OpenServiceRequestClientSummaryModel.fromJson(
    json['client'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$OpenServiceRequestDetailModelToJson(
  _OpenServiceRequestDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'location': instance.location,
  'status': instance.status,
  'displayStatus': instance.displayStatus,
  'price': instance.price,
  'priceMode': instance.priceMode,
  'photosCount': instance.photosCount,
  'applicationsCount': instance.applicationsCount,
  'photos': instance.photos,
  'createdAt': dateTimeToJson(instance.createdAt),
  'canApply': instance.canApply,
  'hasApplied': instance.hasApplied,
  'applicationStatus': instance.applicationStatus,
  'applicationId': instance.applicationId,
  'client': instance.client,
};
