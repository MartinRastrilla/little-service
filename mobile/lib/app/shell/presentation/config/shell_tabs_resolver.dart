import 'package:mobile/app/shell/domain/active_app_role.dart';
import 'package:mobile/app/shell/domain/resolve_active_role.dart';
import 'package:mobile/app/shell/presentation/config/client_shell_tabs.dart';
import 'package:mobile/app/shell/presentation/config/freelancer_shell_tabs.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';
import 'package:mobile/features/auth/domain/entities/app_user.dart';

List<ShellTabDefinition> resolveShellTabs(AppUser user) {
  final role = resolveActiveRole(user);
  return switch (role) {
    ActiveAppRole.client => clientShellTabs,
    ActiveAppRole.freelancer => freelancerShellTabs,
  };
}

ShellTabDefinition? findShellTab(
  List<ShellTabDefinition> tabs,
  ShellTabId id,
) {
  for (final tab in tabs) {
    if (tab.id == id) return tab;
  }
  return null;
}
