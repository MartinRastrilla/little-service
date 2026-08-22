import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ChatReadOnlyBanner extends StatelessWidget {
  final String? blockedReason;

  const ChatReadOnlyBanner({
    super.key,
    this.blockedReason,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: context.colors.secondaryContainer,
      child: Text(
        blockedReason ??
            'El pedido está cerrado o cancelado. Solo podés leer el historial.',
        textAlign: TextAlign.center,
        style: context.text.bodySmall?.copyWith(
          color: context.colors.onSecondaryContainer,
        ),
      ),
    );
  }
}
