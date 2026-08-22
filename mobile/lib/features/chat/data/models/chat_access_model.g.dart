// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatAccessModel _$ChatAccessModelFromJson(Map<String, dynamic> json) =>
    _ChatAccessModel(
      canOpen: json['canOpen'] as bool? ?? false,
      canSend: json['canSend'] as bool? ?? false,
      isReadOnly: json['isReadOnly'] as bool? ?? false,
      waitingForClientMessage:
          json['waitingForClientMessage'] as bool? ?? false,
      blockedReason: json['blockedReason'] as String?,
    );

Map<String, dynamic> _$ChatAccessModelToJson(_ChatAccessModel instance) =>
    <String, dynamic>{
      'canOpen': instance.canOpen,
      'canSend': instance.canSend,
      'isReadOnly': instance.isReadOnly,
      'waitingForClientMessage': instance.waitingForClientMessage,
      'blockedReason': instance.blockedReason,
    };
