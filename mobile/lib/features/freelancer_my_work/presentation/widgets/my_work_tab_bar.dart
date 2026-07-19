import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';

class MyWorkTabBar extends StatelessWidget {
  final FreelancerMyWorkTab selectedTab;
  final ValueChanged<FreelancerMyWorkTab> onTabChanged;

  const MyWorkTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          _TabButton(
            label: 'Postulaciones',
            isSelected: selectedTab == FreelancerMyWorkTab.applications,
            onTap: () => onTabChanged(FreelancerMyWorkTab.applications),
          ),
          const SizedBox(width: 24),
          _TabButton(
            label: 'Trabajos',
            isSelected: selectedTab == FreelancerMyWorkTab.jobs,
            onTap: () => onTabChanged(FreelancerMyWorkTab.jobs),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: context.text.titleSmall?.copyWith(
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3,
              width: isSelected ? 72 : 0,
              decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
