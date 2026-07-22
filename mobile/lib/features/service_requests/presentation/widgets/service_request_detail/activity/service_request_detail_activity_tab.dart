import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_activity.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/activity_load_status.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_state.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/activity/service_request_activity_summary_cards.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/activity/service_request_activity_timeline.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/activity/service_request_recent_application_tile.dart';

class ServiceRequestDetailActivityTab extends StatelessWidget {
  final String serviceRequestId;

  const ServiceRequestDetailActivityTab({
    super.key,
    required this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceRequestDetailBloc, ServiceRequestDetailState>(
      builder: (context, state) {
        if (state is! ServiceRequestDetailLoaded) {
          return const SizedBox.shrink();
        }

        return switch (state.activityStatus) {
          ActivityLoadStatus.initial ||
          ActivityLoadStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),
          ActivityLoadStatus.failure => _ActivityFailureView(
            message: state.activityErrorMessage ?? 'Error desconocido',
            onRetry: () => context.read<ServiceRequestDetailBloc>().add(
              const ServiceRequestDetailEvent.activityRefreshRequested(),
            ),
          ),
          ActivityLoadStatus.loaded when state.activity != null =>
            _ActivityContent(
              serviceRequestId: serviceRequestId,
              activity: state.activity!,
            ),
          ActivityLoadStatus.loaded => const SizedBox.shrink(),
        };
      },
    );
  }
}

class _ActivityContent extends StatelessWidget {
  final String serviceRequestId;
  final ServiceRequestActivity activity;

  const _ActivityContent({
    required this.serviceRequestId,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ServiceRequestActivityTimeline(steps: activity.timeline),
          const SizedBox(height: 16),
          ServiceRequestActivitySummaryCards(
            messagesCount: activity.messagesCount,
            applicationsCount: activity.applicationsCount,
          ),
          if (activity.showRecentApplications) ...[
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Postulaciones recientes',
                    style: context.text.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
                TextButton(
                  // TODO(iter-3): navigate to full applications list.
                  onPressed: null,
                  child: const Text('Ver todas'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (activity.recentApplications.isEmpty)
              Text(
                'Aún no hay postulaciones',
                style: context.text.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              )
            else ...[
              ...activity.recentApplications.map(
                (application) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ServiceRequestRecentApplicationTile(
                    serviceRequestId: serviceRequestId,
                    application: application,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                // TODO(iter-3): navigate to full applications list.
                onPressed: null,
                child: Text(
                  'Ver todas las postulaciones (${activity.applicationsCount})',
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _ActivityFailureView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ActivityFailureView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: context.appColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              'No pudimos cargar la actividad',
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }
}
