import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_summary.dart';
import 'package:mobile/features/freelancer_home/presentation/bloc/freelancer_home_bloc.dart';
import 'package:mobile/features/freelancer_home/presentation/bloc/freelancer_home_event.dart';
import 'package:mobile/features/freelancer_home/presentation/bloc/freelancer_home_state.dart';
import 'package:mobile/features/freelancer_home/presentation/utils/extract_first_name.dart';
import 'package:mobile/features/freelancer_home/presentation/widgets/freelancer_advanced_filters_fab.dart';
import 'package:mobile/features/freelancer_home/presentation/widgets/freelancer_home_date_filter_chips.dart';
import 'package:mobile/features/freelancer_home/presentation/widgets/freelancer_home_empty_state.dart';
import 'package:mobile/features/freelancer_home/presentation/widgets/freelancer_home_header.dart';
import 'package:mobile/features/freelancer_home/presentation/widgets/freelancer_home_search_field.dart';
import 'package:mobile/features/freelancer_home/presentation/widgets/open_service_request_card.dart';
import 'package:mobile/features/freelancer_home/presentation/widgets/open_service_request_card_skeleton.dart';

class FreelancerHomePage extends StatefulWidget {
  const FreelancerHomePage({super.key});

  @override
  State<FreelancerHomePage> createState() => _FreelancerHomePageState();
}

class _FreelancerHomePageState extends State<FreelancerHomePage> {
  final _searchController = TextEditingController();
  Timer? _searchDebounce;
  OpenServiceRequestDateFilter _selectedFilter =
      OpenServiceRequestDateFilter.all;

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

  void _loadRequests({
    OpenServiceRequestDateFilter? filter,
    String? search,
  }) {
    context.read<FreelancerHomeBloc>().add(
          FreelancerHomeEvent.requested(
            filter: filter ?? _selectedFilter,
            search: search ?? _searchController.text,
          ),
        );
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 750), () {
      _loadRequests(search: value);
    });
  }

  void _onFilterChanged(OpenServiceRequestDateFilter filter) {
    setState(() => _selectedFilter = filter);
    _loadRequests(filter: filter);
  }

  @override
  Widget build(BuildContext context) {
    final firstName = context.select<AuthBloc, String>((bloc) {
      return bloc.state.maybeWhen(
        authenticated: (session) => extractFirstName(session.user.name),
        orElse: () => '',
      );
    });

    return Scaffold(
      backgroundColor: context.colors.surfaceContainerLow,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FreelancerHomeHeader(firstName: firstName),
            FreelancerHomeSearchField(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),
            const SizedBox(height: 16),
            FreelancerHomeDateFilterChips(
              selected: _selectedFilter,
              onFilterChanged: _onFilterChanged,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Trabajos disponibles',
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<FreelancerHomeBloc, FreelancerHomeState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => _LoadingList(),
                    loaded: (
                      requests,
                      currentFilter,
                      currentSearch,
                      isFilteredOrSearched,
                    ) =>
                        _RequestsList(requests: requests),
                    empty: (
                      currentFilter,
                      currentSearch,
                      isFilteredOrSearched,
                    ) =>
                        FreelancerHomeEmptyState(
                      isFilteredOrSearched: isFilteredOrSearched,
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
      floatingActionButton: const FreelancerAdvancedFiltersFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 88),
      itemCount: 5,
      itemBuilder: (_, index) => const OpenServiceRequestCardSkeleton(),
    );
  }
}

class _RequestsList extends StatelessWidget {
  final List<OpenServiceRequestSummary> requests;

  const _RequestsList({required this.requests});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 88),
      itemCount: requests.length,
      itemBuilder: (context, index) {
        return OpenServiceRequestCard(request: requests[index]);
      },
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
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.text.bodyLarge?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
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
