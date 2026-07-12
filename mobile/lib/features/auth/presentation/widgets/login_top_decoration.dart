import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class LoginTopDecoration extends StatelessWidget {
  const LoginTopDecoration({super.key});

  static double circleRadius(BuildContext context) {
    return (MediaQuery.sizeOf(context).width * 0.42).clamp(150.0, 180.0);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = context.colors.primaryContainer.withValues(
      alpha: isDark ? 0.85 : 1,
    );
    final radius = circleRadius(context);
    final diameter = radius * 2;

    // Shift circle so ~3/4 is visible; ~1/4 sits off-screen above-left of the corner.
    final offset = radius;

    return Positioned(
      top: 0,
      left: 0,
      child: Transform.translate(
        offset: Offset(-offset, -offset),
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
