import 'package:mobile/features/auth/domain/entities/app_user.dart';

class AuthSession {
  final String token;
  final DateTime expiresAt;
  final AppUser user;

  const AuthSession({
    required this.token,
    required this.expiresAt,
    required this.user,
  });
}
