import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/auth/data/models/role_model.dart';
import 'package:mobile/features/auth/domain/entities/app_user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String name,
    required String email,
    @Default(<RoleModel>[]) List<RoleModel> roles,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  AppUser toEntity() => AppUser(
    id: id,
    name: name,
    email: email,
    roles: roles.map((role) => role.toEntity()).toList(),
  );
}
