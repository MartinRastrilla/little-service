// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRequestInfoPhotoModel _$ServiceRequestInfoPhotoModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestInfoPhotoModel(
  id: stringFromJson(json['id']),
  filePath: json['filePath'] as String,
);

Map<String, dynamic> _$ServiceRequestInfoPhotoModelToJson(
  _ServiceRequestInfoPhotoModel instance,
) => <String, dynamic>{'id': instance.id, 'filePath': instance.filePath};

_ServiceRequestInfoModel _$ServiceRequestInfoModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestInfoModel(
  id: stringFromJson(json['id']),
  title: json['title'] as String,
  description: json['description'] as String,
  location: json['location'] as String,
  status: json['status'] as String,
  displayStatus: json['displayStatus'] as String,
  contractStatus: json['contractStatus'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  priceMode: json['priceMode'] as String,
  isEditable: json['isEditable'] as bool? ?? false,
  canCancel: json['canCancel'] as bool? ?? false,
  cancelBlockedReason: json['cancelBlockedReason'] as String?,
  editBlockedReason: json['editBlockedReason'] as String?,
  messagesCount: (json['messagesCount'] as num?)?.toInt() ?? 0,
  applicationsCount: (json['applicationsCount'] as num?)?.toInt() ?? 0,
  photos:
      (json['photos'] as List<dynamic>?)
          ?.map(
            (e) => ServiceRequestInfoPhotoModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <ServiceRequestInfoPhotoModel>[],
  createdAt: dateTimeFromJson(json['createdAt']),
);

Map<String, dynamic> _$ServiceRequestInfoModelToJson(
  _ServiceRequestInfoModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'location': instance.location,
  'status': instance.status,
  'displayStatus': instance.displayStatus,
  'contractStatus': instance.contractStatus,
  'price': instance.price,
  'priceMode': instance.priceMode,
  'isEditable': instance.isEditable,
  'canCancel': instance.canCancel,
  'cancelBlockedReason': instance.cancelBlockedReason,
  'editBlockedReason': instance.editBlockedReason,
  'messagesCount': instance.messagesCount,
  'applicationsCount': instance.applicationsCount,
  'photos': instance.photos,
  'createdAt': dateTimeToJson(instance.createdAt),
};
