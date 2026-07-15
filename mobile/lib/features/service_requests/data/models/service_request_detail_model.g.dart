// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRequestPhotoModel _$ServiceRequestPhotoModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestPhotoModel(
  id: stringFromJson(json['id']),
  filePath: json['filePath'] as String,
);

Map<String, dynamic> _$ServiceRequestPhotoModelToJson(
  _ServiceRequestPhotoModel instance,
) => <String, dynamic>{'id': instance.id, 'filePath': instance.filePath};

_ServiceRequestDetailModel _$ServiceRequestDetailModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestDetailModel(
  id: stringFromJson(json['id']),
  title: json['title'] as String,
  description: json['description'] as String,
  location: json['location'] as String,
  status: json['status'] as String,
  price: (json['price'] as num?)?.toDouble(),
  clientId: stringFromJson(json['clientId']),
  freelancerPickedId: stringFromJson(json['freelancerPickedId']),
  applicationsCount: (json['applicationsCount'] as num?)?.toInt() ?? 0,
  photos:
      (json['photos'] as List<dynamic>?)
          ?.map(
            (e) => ServiceRequestPhotoModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ServiceRequestPhotoModel>[],
  createdAt: dateTimeFromJson(json['createdAt']),
  updatedAt: _nullableDateTimeFromJson(json['updatedAt']),
);

Map<String, dynamic> _$ServiceRequestDetailModelToJson(
  _ServiceRequestDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'location': instance.location,
  'status': instance.status,
  'price': instance.price,
  'clientId': instance.clientId,
  'freelancerPickedId': instance.freelancerPickedId,
  'applicationsCount': instance.applicationsCount,
  'photos': instance.photos,
  'createdAt': dateTimeToJson(instance.createdAt),
  'updatedAt': _nullableDateTimeToJson(instance.updatedAt),
};
