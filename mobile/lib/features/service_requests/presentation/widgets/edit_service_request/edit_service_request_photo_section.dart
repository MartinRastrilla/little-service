import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';
import 'package:mobile/features/service_requests/presentation/validators/create_service_request_validators.dart';

class EditServiceRequestPhotoSection extends StatelessWidget {
  final List<ServiceRequestInfoPhoto> existingPhotos;
  final List<String> deletedPhotoIds;
  final List<ServiceRequestPhotoInput> newPhotos;
  final void Function(List<String> deletedPhotoIds, List<ServiceRequestPhotoInput> newPhotos)
      onPhotosChanged;
  final void Function(String message) onError;

  const EditServiceRequestPhotoSection({
    super.key,
    required this.existingPhotos,
    required this.deletedPhotoIds,
    required this.newPhotos,
    required this.onPhotosChanged,
    required this.onError,
  });

  List<ServiceRequestInfoPhoto> get _visibleExistingPhotos =>
      existingPhotos.where((photo) => !deletedPhotoIds.contains(photo.id)).toList();

  int get _totalCount => _visibleExistingPhotos.length + newPhotos.length;

  Future<void> _pickPhotos(BuildContext context) async {
    final remaining = maxServiceRequestPhotos - _totalCount;
    if (remaining <= 0) return;

    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage(
      imageQuality: 85,
      limit: remaining,
    );

    if (pickedFiles.isEmpty) return;

    final updated = List<ServiceRequestPhotoInput>.from(newPhotos);

    for (final file in pickedFiles) {
      if (_totalCount + updated.length - newPhotos.length >= maxServiceRequestPhotos) {
        break;
      }

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

    onPhotosChanged(deletedPhotoIds, updated);
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

  void _removeExisting(String photoId) {
    final updatedDeleted = List<String>.from(deletedPhotoIds)..add(photoId);
    onPhotosChanged(updatedDeleted, newPhotos);
  }

  void _removeNew(int index) {
    final updated = List<ServiceRequestPhotoInput>.from(newPhotos)..removeAt(index);
    onPhotosChanged(deletedPhotoIds, updated);
  }

  @override
  Widget build(BuildContext context) {
    final visibleExisting = _visibleExistingPhotos;
    final itemCount =
        _totalCount < maxServiceRequestPhotos ? _totalCount + 1 : _totalCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Fotos del pedido',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Podés subir hasta $maxServiceRequestPhotos fotos.',
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
            if (index < visibleExisting.length) {
              final photo = visibleExisting[index];
              return _ExistingPhotoThumbnail(
                url: photo.url,
                onRemove: () => _removeExisting(photo.id),
              );
            }

            final newPhotoIndex = index - visibleExisting.length;
            if (newPhotoIndex < newPhotos.length) {
              return _LocalPhotoThumbnail(
                path: newPhotos[newPhotoIndex].path,
                onRemove: () => _removeNew(newPhotoIndex),
              );
            }

            return _AddPhotoTile(onTap: () => _pickPhotos(context));
          },
        ),
      ],
    );
  }
}

class _ExistingPhotoThumbnail extends StatelessWidget {
  final String url;
  final VoidCallback onRemove;

  const _ExistingPhotoThumbnail({
    required this.url,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(
              color: context.colors.surfaceContainerHighest,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (_, __, ___) => Container(
              color: context.colors.surfaceContainerHighest,
              child: Icon(
                Icons.broken_image_outlined,
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
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

class _LocalPhotoThumbnail extends StatelessWidget {
  final String path;
  final VoidCallback onRemove;

  const _LocalPhotoThumbnail({
    required this.path,
    required this.onRemove,
  });

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
