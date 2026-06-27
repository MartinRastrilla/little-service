import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/auth/domain/entities/app_user.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
abstract class RoleModel with _$RoleModel {
  const RoleModel._();

  const factory RoleModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String name,
    @Default('') String description,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  AppRole toEntity() => AppRole(name: name);
}
