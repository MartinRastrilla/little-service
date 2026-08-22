// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _ChatMessageModel(
      id: stringFromJson(json['id']),
      fromUserId: stringFromJson(json['fromUserId']),
      toUserId: stringFromJson(json['toUserId']),
      serviceRequestId: stringFromJson(json['serviceRequestId']),
      content: json['content'] as String,
      createdAt: dateTimeFromJson(json['createdAt']),
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatMessageModelToJson(_ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromUserId': instance.fromUserId,
      'toUserId': instance.toUserId,
      'serviceRequestId': instance.serviceRequestId,
      'content': instance.content,
      'createdAt': dateTimeToJson(instance.createdAt),
      'isRead': instance.isRead,
    };
