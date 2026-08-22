import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/chat/domain/entities/conversation_summary.dart';

part 'conversation_summary_model.freezed.dart';
part 'conversation_summary_model.g.dart';

@freezed
abstract class ConversationSummaryModel with _$ConversationSummaryModel {
  const ConversationSummaryModel._();

  const factory ConversationSummaryModel({
    @JsonKey(fromJson: stringFromJson) required String serviceRequestId,
    @JsonKey(fromJson: stringFromJson) required String withUserId,
    @Default('') String withUserName,
    String? lastMessageContent,
    @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
    DateTime? lastMessageAt,
    @Default(0) int unreadCount,
  }) = _ConversationSummaryModel;

  factory ConversationSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationSummaryModelFromJson(json);

  ConversationSummary toEntity() => ConversationSummary(
        serviceRequestId: serviceRequestId,
        withUserId: withUserId,
        withUserName: withUserName,
        lastMessageContent: lastMessageContent,
        lastMessageAt: lastMessageAt,
        unreadCount: unreadCount,
      );
}
