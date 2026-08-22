import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
abstract class ChatMessageModel with _$ChatMessageModel {
  const ChatMessageModel._();

  const factory ChatMessageModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(fromJson: stringFromJson) required String fromUserId,
    @JsonKey(fromJson: stringFromJson) required String toUserId,
    @JsonKey(fromJson: stringFromJson) required String serviceRequestId,
    required String content,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
    @Default(false) bool isRead,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  ChatMessage toEntity() => ChatMessage(
        id: id,
        fromUserId: fromUserId,
        toUserId: toUserId,
        serviceRequestId: serviceRequestId,
        content: content,
        createdAt: createdAt,
        isRead: isRead,
      );
}
