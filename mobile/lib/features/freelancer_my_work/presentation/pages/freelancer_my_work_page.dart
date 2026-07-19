import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';
import 'package:mobile/features/freelancer_my_work/presentation/bloc/freelancer_my_work_bloc.dart';
import 'package:mobile/features/freelancer_my_work/presentation/bloc/freelancer_my_work_event.dart';
import 'package:mobile/features/freelancer_my_work/presentation/bloc/freelancer_my_work_state.dart';
import 'package:mobile/features/freelancer_my_work/presentation/widgets/applications_promo_banner.dart';
import 'package:mobile/features/freelancer_my_work/presentation/widgets/freelancer_application_card.dart';
import 'package:mobile/features/freelancer_my_work/presentation/widgets/freelancer_job_card.dart';
import 'package:mobile/features/freelancer_my_work/presentation/widgets/my_work_filter_chips.dart';
import 'package:mobile/features/freelancer_my_work/presentation/widgets/my_work_header.dart';
import 'package:mobile/features/freelancer_my_work/presentation/widgets/my_work_tab_bar.dart';

class FreelancerMyWorkPage extends StatelessWidget {
  final FreelancerMyWorkTab? initialTab;

  const FreelancerMyWorkPage({super.key, this.initialTab});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FreelancerMyWorkBloc>()
        ..add(FreelancerMyWorkEvent.started(initialTab: initialTab)),
      child: _FreelancerMyWorkView(initialTab: initialTab),
    );
  }
}

class _FreelancerMyWorkView extends StatelessWidget {
  final FreelancerMyWorkTab? initialTab;

  const _FreelancerMyWorkView({this.initialTab});

  FreelancerMyWorkTab _resolveTab(FreelancerMyWorkState state) {
    return state.map(
      initial: (_) => initialTab ?? FreelancerMyWorkTab.applications,
      loading: (s) => s.tab,
      loaded: (s) => s.tab,
      empty: (s) => s.tab,
      failure: (s) => s.tab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreelancerMyWorkBloc, FreelancerMyWorkState>(
      builder: (context, state) {
        final tab = _resolveTab(state);
        final applicationFilter = state.maybeMap(
          loading: (s) => s.applicationFilter,
          loaded: (s) => s.applicationFilter,
          empty: (s) => s.applicationFilter,
          failure: (s) => s.applicationFilter,
          orElse: () => FreelancerApplicationFilter.all,
        );
        final jobFilter = state.maybeMap(
          loading: (s) => s.jobFilter,
          loaded: (s) => s.jobFilter,
          empty: (s) => s.jobFilter,
          failure: (s) => s.jobFilter,
          orElse: () => FreelancerJobFilter.all,
        );

        return Scaffold(
          backgroundColor: context.colors.surfaceContainerLow,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyWorkHeader(tab: tab),
                MyWorkTabBar(
                  selectedTab: tab,
                  onTabChanged: (value) => context
                      .read<FreelancerMyWorkBloc>()
                      .add(FreelancerMyWorkEvent.tabChanged(tab: value)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: tab == FreelancerMyWorkTab.applications
                      ? ApplicationFilterChips(
                          selected: applicationFilter,
                          onFilterChanged: (filter) => context
                              .read<FreelancerMyWorkBloc>()
                              .add(
                                FreelancerMyWorkEvent.applicationFilterChanged(
                                  filter: filter,
                                ),
                              ),
                        )
                      : JobFilterChips(
                          selected: jobFilter,
                          onFilterChanged: (filter) => context
                              .read<FreelancerMyWorkBloc>()
                              .add(
                                FreelancerMyWorkEvent.jobFilterChanged(
                                  filter: filter,
                                ),
                              ),
                        ),
                ),
                const SizedBox(height: 12),
                Expanded(child: _buildBody(context, state, tab)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    FreelancerMyWorkState state,
    FreelancerMyWorkTab tab,
  ) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: (_, __, ___) => const Center(child: CircularProgressIndicator()),
      loaded: (_, __, ___, applications, jobs) => _buildList(
        context,
        tab,
        tab == FreelancerMyWorkTab.applications ? applications : jobs,
      ),
      empty: (_, __, ___) => _EmptyView(tab: tab),
      failure: (_, __, ___, message) => _FailureView(
        message: message,
        onRetry: () => context
            .read<FreelancerMyWorkBloc>()
            .add(const FreelancerMyWorkEvent.retry()),
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    FreelancerMyWorkTab tab,
    List<FreelancerWorkItem> items,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      itemCount: items.length + (tab == FreelancerMyWorkTab.applications ? 1 : 0),
      itemBuilder: (context, index) {
        if (tab == FreelancerMyWorkTab.applications && index == items.length) {
          return const ApplicationsPromoBanner();
        }

        final item = items[index];
        if (tab == FreelancerMyWorkTab.applications) {
          return FreelancerApplicationCard(item: item);
        }
        return FreelancerJobCard(item: item);
      },
    );
  }
}

class _EmptyView extends StatelessWidget {
  final FreelancerMyWorkTab tab;

  const _EmptyView({required this.tab});

  @override
  Widget build(BuildContext context) {
    final message = tab == FreelancerMyWorkTab.applications
        ? 'Aún no te postulaste a ningún trabajo'
        : 'Todavía no tenés trabajos contratados';

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: context.text.bodyLarge?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
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
