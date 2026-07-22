import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ProfileBackToJobButton extends StatelessWidget {
  final String serviceRequestId;

  const ProfileBackToJobButton({
    super.key,
    required this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
        child: OutlinedButton.icon(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
          label: const Text('Volver al trabajo'),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            foregroundColor: context.colors.primary,
            side: BorderSide(color: context.colors.primary),
          ),
        ),
      ),
    );
  }
}
