// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_read_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessagesReadEventModel _$MessagesReadEventModelFromJson(
  Map<String, dynamic> json,
) => _MessagesReadEventModel(
  serviceRequestId: stringFromJson(json['serviceRequestId']),
  readByUserId: stringFromJson(json['readByUserId']),
  withUserId: stringFromJson(json['withUserId']),
  readAt: dateTimeFromJson(json['readAt']),
);

Map<String, dynamic> _$MessagesReadEventModelToJson(
  _MessagesReadEventModel instance,
) => <String, dynamic>{
  'serviceRequestId': instance.serviceRequestId,
  'readByUserId': instance.readByUserId,
  'withUserId': instance.withUserId,
  'readAt': dateTimeToJson(instance.readAt),
};
