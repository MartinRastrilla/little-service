// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRequestSummaryModel _$ServiceRequestSummaryModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestSummaryModel(
  id: stringFromJson(json['id']),
  title: json['title'] as String,
  description: json['description'] as String,
  location: json['location'] as String,
  status: json['status'] as String,
  displayStatus: json['displayStatus'] as String,
  price: (json['price'] as num?)?.toDouble(),
  clientId: stringFromJson(json['clientId']),
  freelancerPickedId: stringFromJson(json['freelancerPickedId']),
  photosCount: (json['photosCount'] as num?)?.toInt() ?? 0,
  contractStatus: json['contractStatus'] as String?,
  coverPhotoUrl: json['coverPhotoUrl'] as String?,
  createdAt: dateTimeFromJson(json['createdAt']),
);

Map<String, dynamic> _$ServiceRequestSummaryModelToJson(
  _ServiceRequestSummaryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'location': instance.location,
  'status': instance.status,
  'displayStatus': instance.displayStatus,
  'price': instance.price,
  'clientId': instance.clientId,
  'freelancerPickedId': instance.freelancerPickedId,
  'photosCount': instance.photosCount,
  'contractStatus': instance.contractStatus,
  'coverPhotoUrl': instance.coverPhotoUrl,
  'createdAt': dateTimeToJson(instance.createdAt),
};
