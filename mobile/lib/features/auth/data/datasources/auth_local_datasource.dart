import 'dart:convert';

import 'package:mobile/core/network/token_storage.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';

class AuthLocalDataSource {
  static const _expiresAtKey = 'expires_at';
  static const _userJsonKey = 'user_json';

  final TokenStorage tokenStorage;

  AuthLocalDataSource(this.tokenStorage);

  // TODO(refresh-token): add refresh_token key when backend supports it.
  // saveSession() must persist both access + refresh tokens.

  Future<void> saveSession(AuthResponseModel session) async {
    await tokenStorage.write(TokenStorage.accessTokenKey, session.token);
    await tokenStorage.write(
      _expiresAtKey,
      session.expiresAt.toUtc().toIso8601String(),
    );
    await tokenStorage.write(
      _userJsonKey,
      jsonEncode(session.user.toJson()),
    );
  }

  Future<AuthResponseModel?> readSession() async {
    final token = await tokenStorage.read(TokenStorage.accessTokenKey);
    final expiresAtRaw = await tokenStorage.read(_expiresAtKey);
    final userJsonRaw = await tokenStorage.read(_userJsonKey);

    if (token == null ||
        token.isEmpty ||
        expiresAtRaw == null ||
        userJsonRaw == null) {
      return null;
    }

    final userJson = jsonDecode(userJsonRaw) as Map<String, dynamic>;

    return AuthResponseModel(
      token: token,
      expiresAt: DateTime.parse(expiresAtRaw),
      user: UserModel.fromJson(userJson),
    );
  }

  Future<void> clearSession() async {
    await tokenStorage.delete(TokenStorage.accessTokenKey);
    await tokenStorage.delete(_expiresAtKey);
    await tokenStorage.delete(_userJsonKey);
    // TODO(refresh-token): delete refresh_token here as well.
  }
}
