import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';
import 'package:mobile/features/client_public_profile/presentation/bloc/client_public_profile_bloc.dart';
import 'package:mobile/features/client_public_profile/presentation/bloc/client_public_profile_event.dart';
import 'package:mobile/features/client_public_profile/presentation/bloc/client_public_profile_state.dart';
import 'package:mobile/features/client_public_profile/presentation/widgets/profile_back_to_job_button.dart';
import 'package:mobile/features/client_public_profile/presentation/widgets/profile_header.dart';
import 'package:mobile/features/client_public_profile/presentation/widgets/profile_info_section.dart';
import 'package:mobile/features/client_public_profile/presentation/widgets/profile_reviews_section.dart';
import 'package:mobile/features/client_public_profile/presentation/widgets/profile_stats_row.dart';
import 'package:mobile/features/client_public_profile/presentation/widgets/profile_trust_indicators.dart';

class ClientPublicProfilePage extends StatelessWidget {
  final String clientId;
  final String? serviceRequestId;

  const ClientPublicProfilePage({
    super.key,
    required this.clientId,
    this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ClientPublicProfileBloc>()
        ..add(ClientPublicProfileEvent.requested(clientId: clientId)),
      child: _ClientPublicProfileView(
        clientId: clientId,
        serviceRequestId: serviceRequestId,
      ),
    );
  }
}

class _ClientPublicProfileView extends StatelessWidget {
  final String clientId;
  final String? serviceRequestId;

  const _ClientPublicProfileView({
    required this.clientId,
    this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Perfil del cliente',
          style: context.text.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ClientPublicProfileBloc, ClientPublicProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (profile) => _ProfileContent(
              profile: profile,
              serviceRequestId: serviceRequestId,
            ),
            failure: (message) => _FailureView(
              message: message,
              onRetry: () => context.read<ClientPublicProfileBloc>().add(
                    ClientPublicProfileEvent.requested(clientId: clientId),
                  ),
            ),
          );
        },
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final ClientPublicProfile profile;
  final String? serviceRequestId;

  const _ProfileContent({
    required this.profile,
    this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileHeader(profile: profile),
                const SizedBox(height: 24),
                ProfileStatsRow(profile: profile),
                const SizedBox(height: 24),
                ProfileInfoSection(profile: profile),
                const SizedBox(height: 24),
                ProfileTrustIndicators(profile: profile),
                const SizedBox(height: 24),
                ProfileReviewsSection(profile: profile),
              ],
            ),
          ),
        ),
        if (serviceRequestId != null && serviceRequestId!.isNotEmpty)
          ProfileBackToJobButton(serviceRequestId: serviceRequestId!),
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
