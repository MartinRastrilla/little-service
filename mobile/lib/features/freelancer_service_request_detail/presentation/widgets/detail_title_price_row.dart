import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/entities/open_service_request_detail.dart';

class DetailTitlePriceRow extends StatelessWidget {
  final OpenServiceRequestDetail detail;

  const DetailTitlePriceRow({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final hasPrice = detail.priceMode == OpenServiceRequestPriceMode.estimated &&
        detail.price != null;
    final priceText =
        hasPrice ? formatArsPrice(detail.price!) : 'Precio a convenir';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            detail.title,
            style: context.text.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              priceText,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: hasPrice
                    ? const Color(0xFF1B8A5A)
                    : context.colors.onSurface,
              ),
            ),
            Text(
              'Presupuesto estimado',
              style: context.text.labelSmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
