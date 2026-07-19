import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/entities/open_service_request_detail.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/bloc/freelancer_service_request_detail_bloc.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/bloc/freelancer_service_request_detail_event.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/bloc/freelancer_service_request_detail_state.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/mappers/apply_error_mapper.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/widgets/apply_confirmation_dialog.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/widgets/detail_apply_bottom_bar.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/widgets/detail_client_card.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/widgets/detail_description_section.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/widgets/detail_location_date_row.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/widgets/detail_stats_row.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/widgets/detail_status_row.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/widgets/detail_title_price_row.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/service_request_detail_photo_gallery.dart';

class FreelancerServiceRequestDetailPage extends StatelessWidget {
  final String serviceRequestId;

  const FreelancerServiceRequestDetailPage({
    super.key,
    required this.serviceRequestId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FreelancerServiceRequestDetailBloc>()
        ..add(
          FreelancerServiceRequestDetailEvent.requested(
            serviceRequestId: serviceRequestId,
          ),
        ),
      child: _FreelancerServiceRequestDetailView(
        serviceRequestId: serviceRequestId,
      ),
    );
  }
}

class _FreelancerServiceRequestDetailView extends StatelessWidget {
  final String serviceRequestId;

  const _FreelancerServiceRequestDetailView({
    required this.serviceRequestId,
  });

  Future<void> _onApplyPressed(BuildContext context) async {
    final confirmed = await showApplyConfirmationDialog(context);
    if (confirmed != true || !context.mounted) return;

    context.read<FreelancerServiceRequestDetailBloc>().add(
          FreelancerServiceRequestDetailEvent.applyConfirmed(
            serviceRequestId: serviceRequestId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FreelancerServiceRequestDetailBloc,
        FreelancerServiceRequestDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          applySuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('¡Postulación enviada con éxito!'),
              ),
            );
            context.go('/shell/activity?tab=applications');
          },
          failure: (message, detail) {
            if (detail != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
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
              'Trabajo disponible',
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.bookmark_border,
                  color: context.colors.onSurfaceVariant.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
          body: state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (detail) => _DetailContent(
              detail: detail,
              isApplying: false,
              onApplyPressed: () => _onApplyPressed(context),
            ),
            applying: (detail) => _DetailContent(
              detail: detail,
              isApplying: true,
              onApplyPressed: null,
            ),
            applySuccess: () => const SizedBox.shrink(),
            failure: (message, detail) {
              if (detail != null) {
                return _DetailContent(
                  detail: detail,
                  isApplying: false,
                  onApplyPressed: () => _onApplyPressed(context),
                );
              }

              return _FailureView(
                message: message,
                onRetry: () => context
                    .read<FreelancerServiceRequestDetailBloc>()
                    .add(
                      FreelancerServiceRequestDetailEvent.requested(
                        serviceRequestId: serviceRequestId,
                      ),
                    ),
              );
            },
          ),
        );
      },
    );
  }
}

class _DetailContent extends StatelessWidget {
  final OpenServiceRequestDetail detail;
  final bool isApplying;
  final VoidCallback? onApplyPressed;

  const _DetailContent({
    required this.detail,
    required this.isApplying,
    required this.onApplyPressed,
  });

  List<ServiceRequestInfoPhoto> _mapPhotos() {
    return detail.photos
        .map((photo) => ServiceRequestInfoPhoto(id: photo.id, url: photo.url))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final applyState = resolveApplyButtonState(
      canApply: detail.canApply,
      hasApplied: detail.hasApplied,
      applicationStatus: detail.applicationStatus,
    );

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailStatusRow(
                  displayStatus: detail.displayStatus,
                  createdAt: detail.createdAt,
                ),
                const SizedBox(height: 16),
                if (detail.photos.isNotEmpty) ...[
                  ServiceRequestDetailPhotoGallery(photos: _mapPhotos()),
                  const SizedBox(height: 20),
                ],
                DetailTitlePriceRow(detail: detail),
                const SizedBox(height: 16),
                DetailLocationDateRow(
                  location: detail.location,
                  createdAt: detail.createdAt,
                ),
                const SizedBox(height: 16),
                DetailDescriptionSection(description: detail.description),
                const SizedBox(height: 20),
                DetailStatsRow(
                  photosCount: detail.photosCount,
                  applicationsCount: detail.applicationsCount,
                ),
                const SizedBox(height: 20),
                DetailClientCard(client: detail.client),
              ],
            ),
          ),
        ),
        DetailApplyBottomBar(
          state: applyState,
          isLoading: isApplying,
          onApplyPressed: onApplyPressed,
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
