import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_applications/service_request_applications_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_applications/service_request_applications_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_applications/service_request_applications_state.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_applications/accept_application_dialog.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_applications/reject_application_dialog.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_applications/service_request_application_card.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_applications/service_request_application_filter_chips.dart';

class ServiceRequestApplicationsPage extends StatelessWidget {
  final String serviceRequestId;

  const ServiceRequestApplicationsPage({
    super.key,
    required this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ServiceRequestApplicationsBloc>()
        ..add(
          ServiceRequestApplicationsEvent.started(
            serviceRequestId: serviceRequestId,
          ),
        ),
      child: ServiceRequestApplicationsView(
        serviceRequestId: serviceRequestId,
      ),
    );
  }
}

class ServiceRequestApplicationsView extends StatelessWidget {
  final String serviceRequestId;

  const ServiceRequestApplicationsView({
    super.key,
    required this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceRequestApplicationsBloc,
        ServiceRequestApplicationsState>(
      listener: (context, state) {
        state.maybeWhen(
          actionSuccess: (accepted) {
            if (accepted) {
              context.pop(true);
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final filter = state.map(
          initial: (_) => ServiceRequestApplicationFilter.pending,
          loading: (value) => value.filter,
          loaded: (value) => value.filter,
          empty: (value) => value.filter,
          failure: (value) => value.filter,
          actionSuccess: (_) => ServiceRequestApplicationFilter.pending,
        );

        final title = state.maybeMap(
          loaded: (value) => value.serviceRequestTitle,
          empty: (value) => value.serviceRequestTitle,
          orElse: () => '',
        );

        final canManageApplications = state.maybeMap(
          loaded: (value) => value.canManageApplications,
          empty: (value) => value.canManageApplications,
          orElse: () => true,
        );

        return Scaffold(
          backgroundColor: context.colors.surfaceContainerLow,
          appBar: AppBar(
            backgroundColor: context.colors.surface,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(false),
            ),
            title: Column(
              children: [
                Text(
                  'Postulaciones',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (title.isNotEmpty)
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ServiceRequestApplicationFilterChips(
                      selected: filter,
                      onFilterChanged: (value) => context
                          .read<ServiceRequestApplicationsBloc>()
                          .add(
                            ServiceRequestApplicationsEvent.filterChanged(
                              filter: value,
                            ),
                          ),
                    ),
                    if (!canManageApplications) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: context.colors.surfaceContainerHighest
                              .withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Ya elegiste un profesional. Podés revisar el historial de postulaciones.',
                          style: context.text.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: switch (state) {
                  ServiceRequestApplicationsInitial() ||
                  ServiceRequestApplicationsLoading() =>
                    const Center(child: CircularProgressIndicator()),
                  ServiceRequestApplicationsFailure(:final message) =>
                    _FailureView(
                      message: message,
                      onRetry: () => context
                          .read<ServiceRequestApplicationsBloc>()
                          .add(
                            const ServiceRequestApplicationsEvent
                                .refreshRequested(),
                          ),
                    ),
                  ServiceRequestApplicationsEmpty(:final filter) =>
                    _EmptyView(filter: filter),
                  ServiceRequestApplicationsLoaded(
                    :final applications,
                    :final canManageApplications,
                    :final actionInProgressApplicationId,
                  ) =>
                    ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                      itemCount: applications.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final application = applications[index];
                        final canShowActions = canManageApplications &&
                            application.isPending;

                        return ServiceRequestApplicationCard(
                          serviceRequestId: serviceRequestId,
                          application: application,
                          canShowActions: canShowActions,
                          isActionInProgress:
                              actionInProgressApplicationId == application.id,
                          onAccept: () => _onAcceptPressed(
                            context,
                            application: application,
                          ),
                          onReject: () => _onRejectPressed(
                            context,
                            application: application,
                          ),
                        );
                      },
                    ),
                  ServiceRequestApplicationsActionSuccess() =>
                    const Center(child: CircularProgressIndicator()),
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onAcceptPressed(
    BuildContext context, {
    required ServiceRequestApplication application,
  }) async {
    final confirmed = await showAcceptApplicationDialog(
      context,
      freelancerName: application.freelancerName,
    );
    if (confirmed != true || !context.mounted) return;

    context.read<ServiceRequestApplicationsBloc>().add(
          ServiceRequestApplicationsEvent.acceptRequested(
            applicationId: application.id,
            freelancerName: application.freelancerName,
          ),
        );
  }

  Future<void> _onRejectPressed(
    BuildContext context, {
    required ServiceRequestApplication application,
  }) async {
    final confirmed = await showRejectApplicationDialog(
      context,
      freelancerName: application.freelancerName,
    );
    if (confirmed != true || !context.mounted) return;

    context.read<ServiceRequestApplicationsBloc>().add(
          ServiceRequestApplicationsEvent.rejectRequested(
            applicationId: application.id,
            freelancerName: application.freelancerName,
          ),
        );

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Postulación rechazada')),
    );
  }
}

class _EmptyView extends StatelessWidget {
  final ServiceRequestApplicationFilter filter;

  const _EmptyView({required this.filter});

  @override
  Widget build(BuildContext context) {
    final message = filter == ServiceRequestApplicationFilter.pending
        ? 'No hay postulaciones pendientes'
        : 'Aún no hay postulaciones';

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.groups_outlined,
              size: 48,
              color: context.colors.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Los profesionales interesados aparecerán acá.',
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _FailureView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _FailureView({
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
              'No pudimos cargar las postulaciones',
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
