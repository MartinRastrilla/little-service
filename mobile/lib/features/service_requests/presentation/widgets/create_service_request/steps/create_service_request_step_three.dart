import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_draft.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_event.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_photo_grid.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_section_header.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_summary_card.dart';

class CreateServiceRequestStepThree extends StatelessWidget {
  final CreateServiceRequestDraft draft;
  final List<ServiceRequestPhotoInput> photos;
  final ValueChanged<List<ServiceRequestPhotoInput>> onPhotosChanged;
  final String? stepError;

  const CreateServiceRequestStepThree({
    super.key,
    required this.draft,
    required this.photos,
    required this.onPhotosChanged,
    this.stepError,
  });

  void submit(BuildContext context) {
    context.read<CreateServiceRequestBloc>().add(
      CreateServiceRequestEvent.stepThreeSubmitted(photos: photos),
    );
  }

  void _showPhotoError(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CreateServiceRequestSectionHeader(
          icon: Icons.photo_camera_outlined,
          title: 'Fotos y confirmación',
          subtitle:
              'Agrega fotos para que los profesionales entiendan mejor el trabajo.',
        ),
        const SizedBox(height: 24),
        CreateServiceRequestPhotoGrid(
          photos: photos,
          onPhotosChanged: onPhotosChanged,
          onError: (message) => _showPhotoError(context, message),
        ),
        if (stepError != null) ...[
          const SizedBox(height: 12),
          Text(
            stepError!,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
        const SizedBox(height: 24),
        CreateServiceRequestSummaryCard(
          draft: draft,
          photoCount: photos.length,
        ),
      ],
    );
  }
}
