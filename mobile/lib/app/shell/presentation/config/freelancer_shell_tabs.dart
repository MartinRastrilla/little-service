import 'package:flutter/material.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';

const freelancerShellTabs = <ShellTabDefinition>[
  ShellTabDefinition(
    id: ShellTabId.home,
    label: 'Inicio',
    icon: Icons.explore_outlined,
    selectedIcon: Icons.explore,
    placeholderTitle: 'Inicio',
    placeholderDescription:
        'Explorá pedidos abiertos y encontrá nuevas oportunidades.',
  ),
  ShellTabDefinition(
    id: ShellTabId.activity,
    label: 'Mis trabajos',
    icon: Icons.work_outline,
    selectedIcon: Icons.work,
    placeholderTitle: 'Mis trabajos',
    placeholderDescription:
        'Seguí tus postulaciones y gestioná tus trabajos activos.',
  ),
  ShellTabDefinition(
    id: ShellTabId.messages,
    label: 'Mensajes',
    icon: Icons.chat_bubble_outline,
    selectedIcon: Icons.chat_bubble,
    placeholderTitle: 'Mensajes',
    placeholderDescription: 'Conversá con clientes sobre tus trabajos.',
  ),
  ShellTabDefinition(
    id: ShellTabId.more,
    label: 'Más',
    icon: Icons.menu,
    selectedIcon: Icons.menu,
    placeholderTitle: 'Más',
    placeholderDescription:
        'Accedé a tu perfil, servicios y otras opciones.',
  ),
];
