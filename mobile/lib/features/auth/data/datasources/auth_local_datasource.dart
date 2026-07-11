import 'dart:convert';

import 'package:mobile/core/network/token_storage.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';

class AuthLocalDataSource {
  static const _expiresAtKey = 'expires_at';
  static const _userJsonKey = 'user_json';

  final TokenStorage tokenStorage;

  AuthLocalDataSource(this.tokenStorage);

  Future<void> saveSession(AuthResponseModel session) async {
    await tokenStorage.write(TokenStorage.accessTokenKey, session.token);
    await tokenStorage.write(
      _expiresAtKey,
      session.expiresAt.toUtc().toIso8601String(),
    );
    await tokenStorage.write(
      TokenStorage.refreshTokenKey,
      session.refreshToken,
    );
    await tokenStorage.write(
      TokenStorage.refreshTokenExpiresAtKey,
      session.refreshTokenExpiresAt.toUtc().toIso8601String(),
    );
    await tokenStorage.write(
      _userJsonKey,
      jsonEncode(session.user.toJson()),
    );
  }

  Future<AuthResponseModel?> readSession() async {
    final token = await tokenStorage.read(TokenStorage.accessTokenKey);
    final expiresAtRaw = await tokenStorage.read(_expiresAtKey);
    final refreshToken = await tokenStorage.read(TokenStorage.refreshTokenKey);
    final refreshTokenExpiresAtRaw = await tokenStorage.read(
      TokenStorage.refreshTokenExpiresAtKey,
    );
    final userJsonRaw = await tokenStorage.read(_userJsonKey);

    if (token == null ||
        token.isEmpty ||
        expiresAtRaw == null ||
        refreshToken == null ||
        refreshToken.isEmpty ||
        refreshTokenExpiresAtRaw == null ||
        userJsonRaw == null) {
      return null;
    }

    final userJson = jsonDecode(userJsonRaw) as Map<String, dynamic>;

    return AuthResponseModel(
      token: token,
      expiresAt: DateTime.parse(expiresAtRaw),
      refreshToken: refreshToken,
      refreshTokenExpiresAt: DateTime.parse(refreshTokenExpiresAtRaw),
      user: UserModel.fromJson(userJson),
    );
  }

  Future<String?> readRefreshToken() =>
      tokenStorage.read(TokenStorage.refreshTokenKey);

  Future<bool> isRefreshTokenExpired() async {
    final expiresAtRaw = await tokenStorage.read(
      TokenStorage.refreshTokenExpiresAtKey,
    );
    if (expiresAtRaw == null) {
      return true;
    }

    return DateTime.parse(expiresAtRaw).isBefore(DateTime.now().toUtc());
  }

  Future<void> clearSession() async {
    await tokenStorage.delete(TokenStorage.accessTokenKey);
    await tokenStorage.delete(_expiresAtKey);
    await tokenStorage.delete(TokenStorage.refreshTokenKey);
    await tokenStorage.delete(TokenStorage.refreshTokenExpiresAtKey);
    await tokenStorage.delete(_userJsonKey);
  }
}
