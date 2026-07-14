import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_state.dart';
import 'package:mobile/features/service_requests/presentation/widgets/my_orders_promo_banner.dart';
import 'package:mobile/features/service_requests/presentation/widgets/new_service_request_fab.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_card.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_filter_chips.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_page_header.dart';

class MyServiceOrdersPage extends StatefulWidget {
  const MyServiceOrdersPage({super.key});

  @override
  State<MyServiceOrdersPage> createState() => _MyServiceOrdersPageState();
}

class _MyServiceOrdersPageState extends State<MyServiceOrdersPage> {
  @override
  void initState() {
    super.initState();
    context.read<MyServiceRequestsBloc>().add(
      const MyServiceRequestsEvent.requested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceContainerLow,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ServiceRequestPageHeader(),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ServiceRequestFilterChips(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<MyServiceRequestsBloc, MyServiceRequestsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (requests) => ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      itemCount: requests.length + 1,
                      itemBuilder: (context, index) {
                        if (index == requests.length) {
                          return const MyOrdersPromoBanner();
                        }

                        return ServiceRequestCard(request: requests[index]);
                      },
                    ),
                    empty: () => _EmptyState(
                      onRetry: () => context.read<MyServiceRequestsBloc>().add(
                        const MyServiceRequestsEvent.requested(),
                      ),
                    ),
                    failure: (message) => _FailureState(
                      message: message,
                      onRetry: () => context.read<MyServiceRequestsBloc>().add(
                        const MyServiceRequestsEvent.requested(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const NewServiceRequestFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onRetry;

  const _EmptyState({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_outlined,
              size: 48,
              color: context.colors.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'Aún no tenés pedidos',
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Cuando crees un pedido, vas a poder verlo y seguir su estado acá.',
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

class _FailureState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _FailureState({
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
              'No pudimos cargar tus pedidos',
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colors.onSurface,
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
