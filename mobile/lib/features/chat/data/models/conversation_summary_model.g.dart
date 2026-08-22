// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationSummaryModel _$ConversationSummaryModelFromJson(
  Map<String, dynamic> json,
) => _ConversationSummaryModel(
  serviceRequestId: stringFromJson(json['serviceRequestId']),
  withUserId: stringFromJson(json['withUserId']),
  withUserName: json['withUserName'] as String? ?? '',
  lastMessageContent: json['lastMessageContent'] as String?,
  lastMessageAt: nullableDateTimeFromJson(json['lastMessageAt']),
  unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ConversationSummaryModelToJson(
  _ConversationSummaryModel instance,
) => <String, dynamic>{
  'serviceRequestId': instance.serviceRequestId,
  'withUserId': instance.withUserId,
  'withUserName': instance.withUserName,
  'lastMessageContent': instance.lastMessageContent,
  'lastMessageAt': nullableDateTimeToJson(instance.lastMessageAt),
  'unreadCount': instance.unreadCount,
};
