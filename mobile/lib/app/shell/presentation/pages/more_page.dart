import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/shell/presentation/config/more_menu_item.dart';
import 'package:mobile/app/shell/presentation/config/more_menu_resolver.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';

// TODO(tech-debt): Add navigation for profile, settings, help and other menu actions.
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  void _handleItemTap(BuildContext context, MoreMenuItemDefinition item) {
    switch (item.id) {
      case 'logout':
        context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (session) {
            final menuItems = resolveMoreMenuItems(session.user);

            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              itemCount: menuItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final isEnabled = item.id == 'logout';

                return Card(
                  child: ListTile(
                    enabled: isEnabled,
                    leading: Icon(
                      item.icon,
                      color: item.isDestructive
                          ? context.colors.error
                          : isEnabled
                          ? context.colors.onSurface
                          : context.colors.onSurfaceVariant.withValues(
                              alpha: 0.5,
                            ),
                    ),
                    title: Text(
                      item.label,
                      style: context.text.bodyLarge?.copyWith(
                        color: item.isDestructive
                            ? context.colors.error
                            : isEnabled
                            ? context.colors.onSurface
                            : context.colors.onSurfaceVariant.withValues(
                                alpha: 0.5,
                              ),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: isEnabled
                        ? Icon(
                            Icons.chevron_right,
                            color: context.colors.onSurfaceVariant,
                          )
                        : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onTap: isEnabled ? () => _handleItemTap(context, item) : null,
                  ),
                );
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
