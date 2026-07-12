import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_assets.dart';
import 'package:mobile/core/theme/theme_context.dart';

class LoginBrandHeader extends StatelessWidget {
  const LoginBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.littleServiceIsotipo,
          height: 72,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: context.text.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: 'Little ',
                style: TextStyle(color: context.colors.primary),
              ),
              TextSpan(
                text: 'Service',
                style: TextStyle(color: context.colors.secondary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Conectamos personas con los mejores profesionales',
          style: context.text.bodySmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
