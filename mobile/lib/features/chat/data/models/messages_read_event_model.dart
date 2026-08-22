import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';

part 'messages_read_event_model.freezed.dart';
part 'messages_read_event_model.g.dart';

@freezed
abstract class MessagesReadEventModel with _$MessagesReadEventModel {
  const factory MessagesReadEventModel({
    @JsonKey(fromJson: stringFromJson) required String serviceRequestId,
    @JsonKey(fromJson: stringFromJson) required String readByUserId,
    @JsonKey(fromJson: stringFromJson) required String withUserId,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime readAt,
  }) = _MessagesReadEventModel;

  factory MessagesReadEventModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesReadEventModelFromJson(json);
}
