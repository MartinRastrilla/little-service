import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class DetailDescriptionSection extends StatefulWidget {
  final String description;

  const DetailDescriptionSection({
    super.key,
    required this.description,
  });

  @override
  State<DetailDescriptionSection> createState() =>
      _DetailDescriptionSectionState();
}

class _DetailDescriptionSectionState extends State<DetailDescriptionSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          maxLines: _expanded ? null : 2,
          overflow: _expanded ? null : TextOverflow.ellipsis,
          style: context.text.bodyMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
            height: 1.4,
          ),
        ),
        if (widget.description.trim().length > 80) ...[
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Text(
              _expanded ? 'Ver menos' : 'Ver más',
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
