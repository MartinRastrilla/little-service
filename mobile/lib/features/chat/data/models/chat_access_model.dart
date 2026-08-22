import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/chat/domain/entities/chat_access.dart';
part 'chat_access_model.freezed.dart';
part 'chat_access_model.g.dart';

@freezed
abstract class ChatAccessModel with _$ChatAccessModel {
  const ChatAccessModel._();

  const factory ChatAccessModel({
    @Default(false) bool canOpen,
    @Default(false) bool canSend,
    @Default(false) bool isReadOnly,
    @Default(false) bool waitingForClientMessage,
    String? blockedReason,
  }) = _ChatAccessModel;

  factory ChatAccessModel.fromJson(Map<String, dynamic> json) =>
      _$ChatAccessModelFromJson(json);

  ChatAccess toEntity() => ChatAccess(
        canOpen: canOpen,
        canSend: canSend,
        isReadOnly: isReadOnly,
        waitingForClientMessage: waitingForClientMessage,
        blockedReason: blockedReason,
      );
}
