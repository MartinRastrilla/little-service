// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    _AuthResponseModel(
      token: json['token'] as String,
      expiresAt: dateTimeFromJson(json['expiresAt']),
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpiresAt: dateTimeFromJson(json['refreshTokenExpiresAt']),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseModelToJson(_AuthResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresAt': dateTimeToJson(instance.expiresAt),
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiresAt': dateTimeToJson(instance.refreshTokenExpiresAt),
      'user': instance.user,
    };
