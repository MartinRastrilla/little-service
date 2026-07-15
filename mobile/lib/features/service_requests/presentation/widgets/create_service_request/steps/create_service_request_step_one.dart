import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/presentation/validators/create_service_request_validators.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_labeled_field.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_section_header.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_tips_card.dart';

class CreateServiceRequestStepOne extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final String? stepError;

  const CreateServiceRequestStepOne({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
    this.stepError,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CreateServiceRequestSectionHeader(
            icon: Icons.edit_note_outlined,
            title: 'Cuéntanos qué necesitas',
            subtitle:
                'Describe el trabajo que quieres realizar para que los profesionales puedan ayudarte.',
          ),
          const SizedBox(height: 24),
          CreateServiceRequestLabeledField(
            controller: titleController,
            label: 'Título',
            hintText: 'Ej. Reparar pérdida de agua en baño',
            helperText: 'Sé claro y específico con el título de tu pedido.',
            maxLength: 200,
            prefixIcon: Icon(
              Icons.title,
              color: context.colors.onSurfaceVariant,
            ),
            validator: (value) => validateServiceRequestTitle(value)?.message,
          ),
          const SizedBox(height: 20),
          CreateServiceRequestLabeledField(
            controller: descriptionController,
            label: 'Descripción',
            hintText:
                'Describe detalladamente el trabajo que necesitas. Incluye cualquier información relevante que considere útil el profesional.',
            helperText:
                'Mientras más detalles brindes, mejores propuestas recibirás.',
            maxLength: 2000,
            minLines: 4,
            maxLines: 8,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 72),
              child: Icon(
                Icons.description_outlined,
                color: context.colors.onSurfaceVariant,
              ),
            ),
            validator: (value) =>
                validateServiceRequestDescription(value)?.message,
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
          const CreateServiceRequestTipsCard(),
        ],
      ),
    );
  }
}
