import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';

class ProfileInfoSection extends StatelessWidget {
  final ClientPublicProfile profile;

  const ProfileInfoSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];

    if (profile.location != null && profile.location!.trim().isNotEmpty) {
      items.add(
        _InfoRow(
          icon: Icons.location_on_outlined,
          label: profile.location!,
        ),
      );
    }

    items.add(
      _InfoRow(
        icon: Icons.calendar_today_outlined,
        label: 'Publica trabajos desde ${profile.memberSince.toLocal().year}',
      ),
    );

    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Información',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: item,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoRow({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: context.colors.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: context.text.bodyMedium?.copyWith(
              color: context.colors.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
