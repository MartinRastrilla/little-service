import 'package:mobile/app/shell/domain/active_app_role.dart';
import 'package:mobile/features/auth/domain/entities/app_user.dart';

ActiveAppRole resolveActiveRole(AppUser user) {
  if (user.roles.length > 1) return ActiveAppRole.client;
  if (user.isClient) return ActiveAppRole.client;
  if (user.isFreelancer) return ActiveAppRole.freelancer;
  // TODO: Admin-only users — handled in a future iteration.
  return ActiveAppRole.client;
}
