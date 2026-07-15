import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_filter_option.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';
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
  final _searchController = TextEditingController();
  Timer? _searchDebounce;
  ServiceRequestFilterOption _selectedFilter = ServiceRequestFilterOption.all;

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _loadRequests({ServiceRequestFilterOption? filter, String? search}) {
    context.read<MyServiceRequestsBloc>().add(
      MyServiceRequestsEvent.requested(
        filter: filter ?? _selectedFilter,
        search: search ?? _searchController.text,
      ),
    );
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      _loadRequests(search: value);
    });
  }

  void _onFilterChanged(ServiceRequestFilterOption filter) {
    setState(() => _selectedFilter = filter);
    _loadRequests(filter: filter);
  }

  Future<void> _openCreateServiceRequest() async {
    final created = await context.push<bool>('/service-requests/create');
    if (created == true && mounted) {
      _loadRequests();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceContainerLow,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ServiceRequestPageHeader(
              searchController: _searchController,
              onSearchChanged: _onSearchChanged,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ServiceRequestFilterChips(
                selected: _selectedFilter,
                onFilterChanged: _onFilterChanged,
              ),
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
                    loadingMore: (requests, _, __, ___, ____, _____) =>
                        _RequestsList(
                      requests: requests,
                      showBottomLoader: true,
                      onScrollEnd: null,
                    ),
                    loaded: (
                      requests,
                      currentFilter,
                      currentSearch,
                      totalCount,
                      hasMore,
                      currentPage,
                      isFilteredOrSearched,
                    ) =>
                        _RequestsList(
                      requests: requests,
                      showBottomLoader: false,
                      onScrollEnd: hasMore
                          ? () => context.read<MyServiceRequestsBloc>().add(
                                const MyServiceRequestsEvent.loadMore(),
                              )
                          : null,
                    ),
                    empty: (currentFilter, currentSearch, isFilteredOrSearched) =>
                        _EmptyState(
                      isFilteredOrSearched: isFilteredOrSearched,
                      onRetry: _loadRequests,
                    ),
                    failure: (message) => _FailureState(
                      message: message,
                      onRetry: _loadRequests,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: NewServiceRequestFab(
        onPressed: _openCreateServiceRequest,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _RequestsList extends StatelessWidget {
  final List<ServiceRequestSummary> requests;
  final bool showBottomLoader;
  final VoidCallback? onScrollEnd;

  const _RequestsList({
    required this.requests,
    required this.showBottomLoader,
    required this.onScrollEnd,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (onScrollEnd != null &&
            notification is ScrollEndNotification &&
            notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 200) {
          onScrollEnd!();
        }
        return false;
      },
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        itemCount: requests.length + 1 + (showBottomLoader ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < requests.length) {
            return ServiceRequestCard(request: requests[index]);
          }

          if (index == requests.length) {
            return const MyOrdersPromoBanner();
          }

          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final bool isFilteredOrSearched;
  final VoidCallback onRetry;

  const _EmptyState({
    required this.isFilteredOrSearched,
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
              Icons.assignment_outlined,
              size: 48,
              color: context.colors.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              isFilteredOrSearched
                  ? 'No encontramos pedidos'
                  : 'Aún no tenés pedidos',
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              isFilteredOrSearched
                  ? 'Probá con otro filtro o término de búsqueda.'
                  : 'Cuando crees un pedido, vas a poder verlo y seguir su estado acá.',
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (isFilteredOrSearched) ...[
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: onRetry,
                child: const Text('Reintentar'),
              ),
            ],
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
