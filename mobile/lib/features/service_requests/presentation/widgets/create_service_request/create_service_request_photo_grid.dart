import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';
import 'package:mobile/features/service_requests/presentation/validators/create_service_request_validators.dart';

class CreateServiceRequestPhotoGrid extends StatelessWidget {
  final List<ServiceRequestPhotoInput> photos;
  final ValueChanged<List<ServiceRequestPhotoInput>> onPhotosChanged;
  final void Function(String message) onError;

  const CreateServiceRequestPhotoGrid({
    super.key,
    required this.photos,
    required this.onPhotosChanged,
    required this.onError,
  });

  Future<void> _pickPhotos(BuildContext context) async {
    final remaining = maxServiceRequestPhotos - photos.length;
    if (remaining <= 0) return;

    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage(
      imageQuality: 85,
      limit: remaining,
    );

    if (pickedFiles.isEmpty) return;

    final updated = List<ServiceRequestPhotoInput>.from(photos);

    for (final file in pickedFiles) {
      if (updated.length >= maxServiceRequestPhotos) break;

      final photoInput = await _toPhotoInput(file);
      if (photoInput == null) continue;

      final error = validateServiceRequestPhotoFile(
        fileName: photoInput.fileName,
        length: photoInput.length,
      );
      if (error != null) {
        onError(error.message);
        continue;
      }

      updated.add(photoInput);
    }

    onPhotosChanged(updated);
  }

  Future<ServiceRequestPhotoInput?> _toPhotoInput(XFile file) async {
    final path = file.path;
    final length = await File(path).length();
    final fileName =
        file.name.isNotEmpty
            ? file.name
            : path.split(Platform.pathSeparator).last;

    return ServiceRequestPhotoInput(
      path: path,
      fileName: fileName,
      mimeType: file.mimeType,
      length: length,
    );
  }

  void _removePhoto(int index) {
    final updated = List<ServiceRequestPhotoInput>.from(photos)
      ..removeAt(index);
    onPhotosChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    final itemCount =
        photos.length < maxServiceRequestPhotos
            ? photos.length + 1
            : photos.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Agrega fotos (opcional)',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Puedes subir hasta $maxServiceRequestPhotos fotos.',
          style: context.text.bodySmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index < photos.length) {
              return _PhotoThumbnail(
                path: photos[index].path,
                onRemove: () => _removePhoto(index),
              );
            }

            return _AddPhotoTile(onTap: () => _pickPhotos(context));
          },
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.colors.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 18,
                color: context.colors.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Las fotos claras y desde diferentes ángulos ayudan a recibir mejores propuestas.',
                  style: context.text.bodySmall?.copyWith(
                    color: context.colors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PhotoThumbnail extends StatelessWidget {
  final String path;
  final VoidCallback onRemove;

  const _PhotoThumbnail({required this.path, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(File(path), fit: BoxFit.cover),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Material(
            color: Colors.black54,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onRemove,
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.close, size: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AddPhotoTile extends StatelessWidget {
  final VoidCallback onTap;

  const _AddPhotoTile({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: context.colors.primary.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 28, color: context.colors.primary),
              const SizedBox(height: 4),
              Text(
                'Agregar foto',
                style: context.text.bodySmall?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
