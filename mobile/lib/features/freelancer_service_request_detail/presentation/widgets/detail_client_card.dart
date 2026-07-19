import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/entities/open_service_request_detail.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/mappers/apply_error_mapper.dart';

class DetailClientCard extends StatelessWidget {
  final OpenServiceRequestClientSummary client;

  const DetailClientCard({
    super.key,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    final profileUrl = resolveMediaUrl(client.clientProfilePictureUrl);
    final hasPhoto = profileUrl.isNotEmpty;

    return Card(
      elevation: 0,
      color: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: context.colors.outline.withValues(alpha: 0.4)),
      ),
      child: InkWell(
        // TODO(future): navigate to public client profile.
        onTap: null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: context.colors.primaryContainer,
                backgroundImage:
                    hasPhoto ? CachedNetworkImageProvider(profileUrl) : null,
                child: hasPhoto
                    ? null
                    : Text(
                        extractInitials(client.clientName),
                        style: context.text.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.colors.primary,
                        ),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobre el cliente',
                      style: context.text.labelSmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      client.clientName,
                      style: context.text.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      client.ratingLabel,
                      style: context.text.bodySmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      '${client.publishedJobsCount} trabajos publicados',
                      style: context.text.bodySmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
