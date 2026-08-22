import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/chat/data/models/chat_message_model.dart';
import 'package:mobile/features/chat/domain/entities/paged_messages.dart';

part 'paged_messages_model.freezed.dart';
part 'paged_messages_model.g.dart';

@freezed
abstract class PagedMessagesModel with _$PagedMessagesModel {
  const PagedMessagesModel._();

  const factory PagedMessagesModel({
    @Default([]) List<ChatMessageModel> items,
    @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
    DateTime? nextCursor,
    @Default(false) bool hasMore,
  }) = _PagedMessagesModel;

  factory PagedMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$PagedMessagesModelFromJson(json);

  PagedMessages toEntity() => PagedMessages(
        items: items.map((m) => m.toEntity()).toList(),
        nextCursor: nextCursor,
        hasMore: hasMore,
      );
}
