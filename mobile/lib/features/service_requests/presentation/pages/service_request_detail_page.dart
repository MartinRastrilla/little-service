import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_state.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/activity/service_request_detail_activity_tab.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/service_request_detail_info_tab.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_status_badge.dart';

class ServiceRequestDetailPage extends StatefulWidget {
  final String serviceRequestId;

  const ServiceRequestDetailPage({
    super.key,
    required this.serviceRequestId,
  });

  @override
  State<ServiceRequestDetailPage> createState() =>
      _ServiceRequestDetailPageState();
}

class _ServiceRequestDetailPageState extends State<ServiceRequestDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ServiceRequestDetailBloc>()
        ..add(
          ServiceRequestDetailEvent.requested(
            serviceRequestId: widget.serviceRequestId,
          ),
        ),
      child: Scaffold(
        backgroundColor: context.colors.surfaceContainerLow,
        appBar: AppBar(
          backgroundColor: context.colors.surface,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Detalle del pedido',
            style: context.text.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              // TODO(iter-3): open detail overflow menu (cancel, report, etc.).
              onPressed: null,
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: BlocBuilder<ServiceRequestDetailBloc, ServiceRequestDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (info, activity, activityStatus, activityErrorMessage) =>
                  _DetailBody(
                info: info,
                tabController: _tabController,
              ),
              failure: (message) => _FailureView(
                message: message,
                onRetry: () => context.read<ServiceRequestDetailBloc>().add(
                  const ServiceRequestDetailEvent.refreshRequested(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  final ServiceRequestInfo info;
  final TabController tabController;

  const _DetailBody({
    required this.info,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: context.colors.surface,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ServiceRequestStatusBadge(displayStatus: info.displayStatus),
                  const SizedBox(width: 12),
                  Text(
                    'Publicado ${formatRelativeTime(info.createdAt)}',
                    style: context.text.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TabBar(
                controller: tabController,
                onTap: (index) {
                  if (index == 1) {
                    context.read<ServiceRequestDetailBloc>().add(
                      const ServiceRequestDetailEvent.activityRequested(),
                    );
                  }
                },
                tabs: const [
                  Tab(
                    icon: Icon(Icons.description_outlined, size: 20),
                    text: 'Información',
                  ),
                  Tab(
                    icon: Icon(Icons.timeline_outlined, size: 20),
                    text: 'Actividad',
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ServiceRequestDetailInfoTab(info: info),
              const ServiceRequestDetailActivityTab(),
            ],
          ),
        ),
      ],
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
              'No pudimos cargar el pedido',
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
