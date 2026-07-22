import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';

class ProfileServicesSection extends StatelessWidget {
  final FreelancerPublicProfile profile;

  const ProfileServicesSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    if (profile.offeredServices.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Servicios',
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.onSurface,
                ),
              ),
            ),
            // TODO(future): navigate to all services screen
          ],
        ),
        const SizedBox(height: 12),
        ...profile.offeredServices.map(
          (service) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ServiceCard(service: service),
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final FreelancerServicePreview service;

  const _ServiceCard({
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.outline.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.primaryContainer.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.home_repair_service_outlined,
              color: context.colors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.title,
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.onSurface,
                  ),
                ),
                if (service.description.trim().isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    service.description.trim(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  'Desde ${formatArsPrice(service.price)}',
                  style: context.text.labelLarge?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
