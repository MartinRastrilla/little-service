// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PagedMessagesModel _$PagedMessagesModelFromJson(Map<String, dynamic> json) =>
    _PagedMessagesModel(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextCursor: nullableDateTimeFromJson(json['nextCursor']),
      hasMore: json['hasMore'] as bool? ?? false,
    );

Map<String, dynamic> _$PagedMessagesModelToJson(_PagedMessagesModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextCursor': nullableDateTimeToJson(instance.nextCursor),
      'hasMore': instance.hasMore,
    };
