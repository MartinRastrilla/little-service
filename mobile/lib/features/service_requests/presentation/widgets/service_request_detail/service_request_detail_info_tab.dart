import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/presentation/widgets/edit_service_request/cancel_service_request_dialog.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/service_request_detail_photo_gallery.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/service_request_detail_quick_actions.dart';
import 'package:share_plus/share_plus.dart';

class ServiceRequestDetailInfoTab extends StatelessWidget {
  final String serviceRequestId;
  final ServiceRequestInfo info;
  final VoidCallback? onApplicationsPressed;
  final Future<void> Function()? onEditPressed;

  const ServiceRequestDetailInfoTab({
    super.key,
    required this.serviceRequestId,
    required this.info,
    this.onApplicationsPressed,
    this.onEditPressed,
  });

  Future<void> _share(BuildContext context) async {
    final message =
        '${info.title}\n${info.location.trim()}\nPedido #${info.id}';
    await SharePlus.instance.share(ShareParams(text: message));
  }

  Future<void> _handleEdit(BuildContext context) async {
    if (onEditPressed != null) {
      await onEditPressed!();
      return;
    }

    if (!info.isEditable) {
      await showEditBlockedDialog(
        context,
        message: info.editBlockedReason ??
            'Este pedido ya no se puede modificar',
      );
      return;
    }

    await context.push<bool>(
      '/service-requests/$serviceRequestId/edit',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ServiceRequestDetailPhotoGallery(photos: info.photos),
          if (info.photos.isNotEmpty) const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  info.title,
                  style: context.text.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.onSurface,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _ShareButton(onPressed: () => _share(context)),
            ],
          ),
          const SizedBox(height: 20),
          _DetailRow(
            icon: Icons.location_on_outlined,
            child: Text(
              info.location.trim(),
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.attach_money,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    info.priceMode == ServiceRequestPriceMode.estimated
                        ? formatArsPrice(info.price!)
                        : 'Precio a convenir',
                    style: context.text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
                if (info.priceMode == ServiceRequestPriceMode.estimated)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F8F0),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'Precio estimado',
                      style: context.text.labelSmall?.copyWith(
                        color: AppPalette.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.calendar_today_outlined,
            child: Text(
              'Creado el ${formatDetailDateTime(info.createdAt)}',
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Descripción',
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          _ExpandableDescription(text: info.description),
          const SizedBox(height: 24),
          ServiceRequestDetailQuickActions(
            serviceRequestId: serviceRequestId,
            isEditable: info.isEditable,
            editBlockedReason: info.editBlockedReason,
            messagesCount: info.messagesCount,
            applicationsCount: info.applicationsCount,
            onApplicationsPressed: onApplicationsPressed,
            onEditPressed: () => _handleEdit(context),
          ),
        ],
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ShareButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: context.colors.surfaceContainerHighest,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onPressed,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: 44,
              height: 44,
              child: Icon(
                Icons.share_outlined,
                color: context.colors.primary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Compartir',
          style: context.text.labelSmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final Widget child;

  const _DetailRow({
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: context.colors.primary),
        const SizedBox(width: 12),
        Expanded(child: child),
      ],
    );
  }
}

class _ExpandableDescription extends StatefulWidget {
  final String text;

  const _ExpandableDescription({required this.text});

  @override
  State<_ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<_ExpandableDescription> {
  static const _collapsedMaxLines = 4;
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? null : _collapsedMaxLines,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: context.text.bodyMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        TextButton(
          onPressed: () => setState(() => _expanded = !_expanded),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(_expanded ? 'Ver menos' : 'Ver más'),
        ),
      ],
    );
  }
}
