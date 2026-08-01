import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_professional.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/activity_load_status.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_state.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/professional/professional_actions_list.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/professional/professional_empty_state.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/professional/professional_engagement_section.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/professional/professional_profile_summary_card.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/professional/professional_quick_actions_row.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/professional/revoke_engagement_dialog.dart';

class ServiceRequestDetailProfessionalTab extends StatelessWidget {
  final String serviceRequestId;

  const ServiceRequestDetailProfessionalTab({
    super.key,
    required this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceRequestDetailBloc, ServiceRequestDetailState>(
      listenWhen: (previous, current) {
        if (previous is! ServiceRequestDetailLoaded ||
            current is! ServiceRequestDetailLoaded) {
          return false;
        }
        return previous.professionalErrorMessage !=
                current.professionalErrorMessage &&
            current.professionalErrorMessage != null;
      },
      listener: (context, state) {
        if (state is ServiceRequestDetailLoaded &&
            state.professionalErrorMessage != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.professionalErrorMessage!)),
            );
        }
      },
      builder: (context, state) {
        if (state is! ServiceRequestDetailLoaded) {
          return const SizedBox.shrink();
        }

        return switch (state.professionalStatus) {
          ActivityLoadStatus.initial ||
          ActivityLoadStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),
          ActivityLoadStatus.failure => _FailureView(
            message: state.professionalErrorMessage ?? 'Error desconocido',
            onRetry: () => context.read<ServiceRequestDetailBloc>().add(
              const ServiceRequestDetailEvent.professionalRefreshRequested(),
            ),
          ),
          ActivityLoadStatus.loaded => _ProfessionalContent(
            serviceRequestId: serviceRequestId,
            professional: state.professional,
            profile: state.freelancerProfile,
            isRevoking: state.isRevokingEngagement,
          ),
        };
      },
    );
  }
}

class _ProfessionalContent extends StatelessWidget {
  final String serviceRequestId;
  final ServiceRequestProfessional? professional;
  final FreelancerPublicProfile? profile;
  final bool isRevoking;

  const _ProfessionalContent({
    required this.serviceRequestId,
    required this.professional,
    required this.profile,
    required this.isRevoking,
  });

  Future<void> _handleRevoke(BuildContext context) async {
    final pro = professional;
    final freelancerProfile = profile;
    if (pro == null || freelancerProfile == null) return;

    if (!pro.actions.canRevokeEngagement) {
      final reason = pro.actions.revokeEngagementBlockedReason;
      if (reason != null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(reason)));
      }
      return;
    }

    final confirmed = await showRevokeEngagementDialog(
      context,
      professionalName: freelancerProfile.fullName,
    );
    if (confirmed != true || !context.mounted) return;

    context.read<ServiceRequestDetailBloc>().add(
      const ServiceRequestDetailEvent.revokeEngagementRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pro = professional;
    if (pro == null || !pro.hasAssignedProfessional) {
      return const ProfessionalEmptyState();
    }

    if (profile == null) {
      return _FailureView(
        message: 'No pudimos cargar el perfil del profesional',
        onRetry: () => context.read<ServiceRequestDetailBloc>().add(
          const ServiceRequestDetailEvent.professionalRefreshRequested(),
        ),
      );
    }

    final freelancerId = pro.freelancerId;
    final comingSoon = () => showProfessionalComingSoonSnackBar(context);

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfessionalProfileSummaryCard(
                profile: profile!,
                professional: pro,
              ),
              const SizedBox(height: 16),
              ProfessionalQuickActionsRow(
                onOpenProfile: freelancerId == null
                    ? null
                    : () => context.push(
                      '/clients/freelancers/$freelancerId?serviceRequestId=$serviceRequestId',
                    ),
                onComingSoon: comingSoon,
              ),
              const SizedBox(height: 24),
              ProfessionalEngagementSection(professional: pro),
              const SizedBox(height: 24),
              ProfessionalActionsList(
                professional: pro,
                professionalName: profile!.fullName,
                onRevokeEngagement: () => _handleRevoke(context),
                onComingSoon: comingSoon,
              ),
            ],
          ),
        ),
        if (isRevoking)
          Container(
            color: context.colors.surface.withValues(alpha: 0.6),
            child: const Center(child: CircularProgressIndicator()),
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
              'No pudimos cargar el profesional',
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
