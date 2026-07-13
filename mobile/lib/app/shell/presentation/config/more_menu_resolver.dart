import 'package:mobile/app/shell/domain/active_app_role.dart';
import 'package:mobile/app/shell/domain/resolve_active_role.dart';
import 'package:mobile/app/shell/presentation/config/client_more_menu.dart';
import 'package:mobile/app/shell/presentation/config/freelancer_more_menu.dart';
import 'package:mobile/app/shell/presentation/config/more_menu_item.dart';
import 'package:mobile/features/auth/domain/entities/app_user.dart';

List<MoreMenuItemDefinition> resolveMoreMenuItems(AppUser user) {
  final role = resolveActiveRole(user);
  return switch (role) {
    ActiveAppRole.client => clientMoreMenuItems,
    ActiveAppRole.freelancer => freelancerMoreMenuItems,
  };
}
