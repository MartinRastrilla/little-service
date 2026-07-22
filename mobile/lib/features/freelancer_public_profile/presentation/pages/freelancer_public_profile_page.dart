import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/bloc/freelancer_public_profile_bloc.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/bloc/freelancer_public_profile_event.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/bloc/freelancer_public_profile_state.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/widgets/profile_about_section.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/widgets/profile_back_button.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/widgets/profile_header.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/widgets/profile_reviews_section.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/widgets/profile_services_section.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/widgets/profile_skills_section.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/widgets/profile_stats_row.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/widgets/profile_trust_indicators.dart';
import 'package:share_plus/share_plus.dart';

class FreelancerPublicProfilePage extends StatelessWidget {
  final String freelancerId;
  final String? serviceRequestId;

  const FreelancerPublicProfilePage({
    super.key,
    required this.freelancerId,
    this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FreelancerPublicProfileBloc>()
        ..add(
          FreelancerPublicProfileEvent.requested(freelancerId: freelancerId),
        ),
      child: _FreelancerPublicProfileView(
        freelancerId: freelancerId,
        serviceRequestId: serviceRequestId,
      ),
    );
  }
}

class _FreelancerPublicProfileView extends StatelessWidget {
  final String freelancerId;
  final String? serviceRequestId;

  const _FreelancerPublicProfileView({
    required this.freelancerId,
    this.serviceRequestId,
  });

  Future<void> _shareProfile(FreelancerPublicProfile profile) async {
    final ratingLine = profile.totalReviewsCount > 0
        ? '${profile.averageRating.toStringAsFixed(1)} · ${profile.totalReviewsCount} reseñas'
        : 'Sin calificaciones';

    final professionLine =
        profile.profession != null && profile.profession!.trim().isNotEmpty
            ? profile.profession!.trim()
            : 'Profesional';

    final message = '${profile.fullName}\n$professionLine\n$ratingLine';
    await SharePlus.instance.share(ShareParams(text: message));
  }

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
          'Perfil profesional',
          style: context.text.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<FreelancerPublicProfileBloc, FreelancerPublicProfileState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (profile) => IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: () => _shareProfile(profile),
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FreelancerPublicProfileBloc, FreelancerPublicProfileState>(
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
              onRetry: () => context.read<FreelancerPublicProfileBloc>().add(
                    FreelancerPublicProfileEvent.requested(
                      freelancerId: freelancerId,
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final FreelancerPublicProfile profile;
  final String? serviceRequestId;

  const _ProfileContent({
    required this.profile,
    required this.serviceRequestId,
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
                ProfileAboutSection(profile: profile),
                if (profile.skills.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  ProfileSkillsSection(profile: profile),
                ],
                if (profile.offeredServices.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  ProfileServicesSection(profile: profile),
                ],
                const SizedBox(height: 24),
                ProfileTrustIndicators(profile: profile),
                const SizedBox(height: 24),
                ProfileReviewsSection(profile: profile),
              ],
            ),
          ),
        ),
        if (serviceRequestId != null && serviceRequestId!.isNotEmpty)
          const ProfileBackButton(),
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
