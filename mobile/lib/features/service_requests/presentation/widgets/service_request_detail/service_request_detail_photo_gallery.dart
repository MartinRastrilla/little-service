import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_assets.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/service_request_detail_photo_viewer.dart';

class ServiceRequestDetailPhotoGallery extends StatefulWidget {
  final List<ServiceRequestInfoPhoto> photos;

  const ServiceRequestDetailPhotoGallery({
    super.key,
    required this.photos,
  });

  @override
  State<ServiceRequestDetailPhotoGallery> createState() =>
      _ServiceRequestDetailPhotoGalleryState();
}

class _ServiceRequestDetailPhotoGalleryState
    extends State<ServiceRequestDetailPhotoGallery> {
  int _selectedIndex = 0;

  void _openViewer(int initialIndex) {
    showServiceRequestPhotoViewer(
      context: context,
      photos: widget.photos,
      initialIndex: initialIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.photos.isEmpty) {
      return const SizedBox.shrink();
    }

    final heroPhoto = widget.photos[_selectedIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () => _openViewer(_selectedIndex),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: _PhotoImage(url: heroPhoto.url),
                ),
              ),
              if (widget.photos.length > 1)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.photo_outlined,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.photos.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (widget.photos.length > 1) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.photos.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final photo = widget.photos[index];
                final isSelected = index == _selectedIndex;

                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: Container(
                    width: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? context.colors.primary
                            : context.colors.outline.withValues(alpha: 0.4),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: _PhotoImage(url: photo.url),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}

class _PhotoImage extends StatelessWidget {
  final String url;

  const _PhotoImage({required this.url});

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = resolveMediaUrl(url);
    final hasRemoteImage = resolvedUrl.isNotEmpty;

    if (!hasRemoteImage) {
      return Image.asset(
        AppAssets.noPicPlaceholder,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return CachedNetworkImage(
      imageUrl: resolvedUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder: (_, _) => Image.asset(
        AppAssets.noPicPlaceholder,
        fit: BoxFit.cover,
      ),
      errorWidget: (_, _, _) => Image.asset(
        AppAssets.noPicPlaceholder,
        fit: BoxFit.cover,
      ),
    );
  }
}
