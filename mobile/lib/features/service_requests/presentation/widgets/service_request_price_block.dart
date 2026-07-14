import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';

class ServiceRequestPriceBlock extends StatelessWidget {
  final double? price;

  const ServiceRequestPriceBlock({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final priceText = price != null
        ? formatArsPrice(price!)
        : 'Precio a convenir';

    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: context.colors.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.attach_money,
            size: 18,
            color: context.colors.primary,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                priceText,
                style: context.text.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.onSurface,
                ),
              ),
              Text(
                'Precio estimado',
                style: context.text.bodySmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
