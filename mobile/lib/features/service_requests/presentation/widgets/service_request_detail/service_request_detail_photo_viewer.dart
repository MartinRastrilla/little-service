import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_assets.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';

Future<void> showServiceRequestPhotoViewer({
  required BuildContext context,
  required List<ServiceRequestInfoPhoto> photos,
  required int initialIndex,
}) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.95),
    builder: (dialogContext) {
      return _ServiceRequestPhotoViewerDialog(
        photos: photos,
        initialIndex: initialIndex,
      );
    },
  );
}

class _ServiceRequestPhotoViewerDialog extends StatefulWidget {
  final List<ServiceRequestInfoPhoto> photos;
  final int initialIndex;

  const _ServiceRequestPhotoViewerDialog({
    required this.photos,
    required this.initialIndex,
  });

  @override
  State<_ServiceRequestPhotoViewerDialog> createState() =>
      _ServiceRequestPhotoViewerDialogState();
}

class _ServiceRequestPhotoViewerDialogState
    extends State<_ServiceRequestPhotoViewerDialog> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.photos.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final resolvedUrl = resolveMediaUrl(widget.photos[index].url);

              return InteractiveViewer(
                child: Center(
                  child: resolvedUrl.isEmpty
                      ? Image.asset(AppAssets.noPicPlaceholder)
                      : CachedNetworkImage(
                          imageUrl: resolvedUrl,
                          fit: BoxFit.contain,
                          placeholder: (_, _) => const Center(
                            child: CircularProgressIndicator(color: Colors.white),
                          ),
                          errorWidget: (_, _, _) =>
                              Image.asset(AppAssets.noPicPlaceholder),
                        ),
                ),
              );
            },
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close, color: Colors.white),
            ),
          ),
          if (widget.photos.length > 1)
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Text(
                '${_currentIndex + 1} / ${widget.photos.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
