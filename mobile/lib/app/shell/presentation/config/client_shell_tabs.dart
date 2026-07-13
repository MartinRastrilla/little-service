import 'package:flutter/material.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';

const clientShellTabs = <ShellTabDefinition>[
  ShellTabDefinition(
    id: ShellTabId.home,
    label: 'Inicio',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    placeholderTitle: 'Inicio',
    placeholderDescription:
        'Descubrí freelancers y servicios para tu próximo proyecto.',
  ),
  ShellTabDefinition(
    id: ShellTabId.activity,
    label: 'Mis pedidos',
    icon: Icons.assignment_outlined,
    selectedIcon: Icons.assignment,
    placeholderTitle: 'Mis pedidos',
    placeholderDescription:
        'Gestioná tus solicitudes y revisá las postulaciones recibidas.',
  ),
  ShellTabDefinition(
    id: ShellTabId.messages,
    label: 'Mensajes',
    icon: Icons.chat_bubble_outline,
    selectedIcon: Icons.chat_bubble,
    placeholderTitle: 'Mensajes',
    placeholderDescription:
        'Conversá con freelancers sobre tus pedidos activos.',
  ),
  ShellTabDefinition(
    id: ShellTabId.more,
    label: 'Más',
    icon: Icons.grid_view_outlined,
    selectedIcon: Icons.grid_view,
    placeholderTitle: 'Más',
    placeholderDescription:
        'Accedé a tu perfil, configuración y otras opciones.',
  ),
];
