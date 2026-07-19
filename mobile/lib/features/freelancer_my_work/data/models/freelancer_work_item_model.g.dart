// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelancer_work_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FreelancerWorkItemModel _$FreelancerWorkItemModelFromJson(
  Map<String, dynamic> json,
) => _FreelancerWorkItemModel(
  id: stringFromJson(json['id']),
  title: json['title'] as String,
  location: json['location'] as String,
  status: json['status'] as String,
  displayStatus: json['displayStatus'] as String,
  price: (json['price'] as num?)?.toDouble(),
  priceMode: json['priceMode'] as String? ?? 'ToBeAgreed',
  photosCount: (json['photosCount'] as num?)?.toInt() ?? 0,
  applicationsCount: (json['applicationsCount'] as num?)?.toInt() ?? 0,
  coverPhotoUrl: json['coverPhotoUrl'] as String?,
  createdAt: dateTimeFromJson(json['createdAt']),
  applicationId: stringFromJson(json['applicationId']),
  applicationStatus: json['applicationStatus'] as String?,
  applicationCreatedAt: nullableDateTimeFromJson(json['applicationCreatedAt']),
  canViewApplicationDetail: json['canViewApplicationDetail'] as bool? ?? false,
  clientName: json['clientName'] as String?,
  contractAmount: (json['contractAmount'] as num?)?.toDouble(),
  contractStartDate: nullableDateTimeFromJson(json['contractStartDate']),
  hasContract: json['hasContract'] as bool? ?? false,
  unreadMessagesCount: (json['unreadMessagesCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$FreelancerWorkItemModelToJson(
  _FreelancerWorkItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'location': instance.location,
  'status': instance.status,
  'displayStatus': instance.displayStatus,
  'price': instance.price,
  'priceMode': instance.priceMode,
  'photosCount': instance.photosCount,
  'applicationsCount': instance.applicationsCount,
  'coverPhotoUrl': instance.coverPhotoUrl,
  'createdAt': dateTimeToJson(instance.createdAt),
  'applicationId': instance.applicationId,
  'applicationStatus': instance.applicationStatus,
  'applicationCreatedAt': nullableDateTimeToJson(instance.applicationCreatedAt),
  'canViewApplicationDetail': instance.canViewApplicationDetail,
  'clientName': instance.clientName,
  'contractAmount': instance.contractAmount,
  'contractStartDate': nullableDateTimeToJson(instance.contractStartDate),
  'hasContract': instance.hasContract,
  'unreadMessagesCount': instance.unreadMessagesCount,
};
