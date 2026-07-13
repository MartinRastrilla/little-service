import 'package:flutter/material.dart';
import 'package:mobile/app/shell/presentation/config/more_menu_item.dart';

const freelancerMoreMenuItems = <MoreMenuItemDefinition>[
  // TODO(tech-debt): Wire navigation to freelancer profile screen.
  MoreMenuItemDefinition(
    id: 'profile',
    label: 'Mi perfil',
    icon: Icons.person_outline,
  ),
  // TODO(tech-debt): Wire navigation to freelancer services screen.
  MoreMenuItemDefinition(
    id: 'services',
    label: 'Mis servicios',
    icon: Icons.design_services_outlined,
  ),
  // TODO(tech-debt): Wire navigation to account settings screen.
  MoreMenuItemDefinition(
    id: 'settings',
    label: 'Configuración',
    icon: Icons.settings_outlined,
  ),
  // TODO(tech-debt): Wire navigation to help / FAQ screen.
  MoreMenuItemDefinition(
    id: 'help',
    label: 'Ayuda',
    icon: Icons.help_outline,
  ),
  MoreMenuItemDefinition(
    id: 'logout',
    label: 'Cerrar sesión',
    icon: Icons.logout,
    isDestructive: true,
  ),
];
