import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';

class ProfileTrustIndicators extends StatelessWidget {
  final ClientPublicProfile profile;

  const ProfileTrustIndicators({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final indicators = <Widget>[
      // TODO(tech-debt): email verification
      _TrustIndicator(
        icon: Icons.mail_outline,
        label: 'Email verificado',
        isActive: profile.isEmailVerified,
      ),
      _TrustIndicator(
        icon: Icons.work_outline,
        label: '${profile.publishedJobsCount} trabajos publicados',
        isActive: true,
      ),
      if (!profile.hasReports)
        const _TrustIndicator(
          icon: Icons.shield_outlined,
          label: 'Sin reportes',
          isActive: true,
        ),
      _TrustIndicator(
        icon: Icons.person_outline,
        label: 'Miembro desde ${profile.memberSince.toLocal().year}',
        isActive: true,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Indicadores de confianza',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 88,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: indicators.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) => SizedBox(
              width: 92,
              child: indicators[index],
            ),
          ),
        ),
      ],
    );
  }
}

class _TrustIndicator extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _TrustIndicator({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? context.colors.primary
        : context.colors.onSurfaceVariant.withValues(alpha: 0.5);

    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 22, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.text.labelSmall?.copyWith(
            color: context.colors.onSurfaceVariant,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
