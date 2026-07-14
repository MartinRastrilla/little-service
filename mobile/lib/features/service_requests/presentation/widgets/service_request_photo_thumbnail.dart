import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_assets.dart';
import 'package:mobile/core/utils/formatters.dart';

class ServiceRequestPhotoThumbnail extends StatelessWidget {
  final String? coverPhotoUrl;
  final int photosCount;

  const ServiceRequestPhotoThumbnail({
    super.key,
    required this.coverPhotoUrl,
    required this.photosCount,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = resolveMediaUrl(coverPhotoUrl);
    final hasRemoteImage = resolvedUrl.isNotEmpty;

    return SizedBox(
      width: 72,
      height: 72,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: hasRemoteImage
                ? CachedNetworkImage(
                    imageUrl: resolvedUrl,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => Image.asset(
                      AppAssets.noPicPlaceholder,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (_, _, _) => Image.asset(
                      AppAssets.noPicPlaceholder,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    AppAssets.noPicPlaceholder,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
          ),
          if (photosCount > 0)
            Positioned(
              right: 4,
              bottom: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.photo_outlined,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '$photosCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
