class ServiceRequestInfoPhoto {
  final String id;
  final String url;

  const ServiceRequestInfoPhoto({
    required this.id,
    required this.url,
  });
}

enum ServiceRequestPriceMode {
  estimated,
  toBeAgreed;

  static ServiceRequestPriceMode fromApi(String value) {
    return switch (value) {
      'Estimated' => ServiceRequestPriceMode.estimated,
      _ => ServiceRequestPriceMode.toBeAgreed,
    };
  }
}

class ServiceRequestInfo {
  final String id;
  final String title;
  final String description;
  final String location;
  final String status;
  final String displayStatus;
  final String? contractStatus;
  final double? price;
  final ServiceRequestPriceMode priceMode;
  final bool isEditable;
  final bool canCancel;
  final String? cancelBlockedReason;
  final String? editBlockedReason;
  final int messagesCount;
  final int applicationsCount;
  final List<ServiceRequestInfoPhoto> photos;
  final DateTime createdAt;

  const ServiceRequestInfo({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.status,
    required this.displayStatus,
    required this.contractStatus,
    required this.price,
    required this.priceMode,
    required this.isEditable,
    required this.canCancel,
    required this.cancelBlockedReason,
    required this.editBlockedReason,
    required this.messagesCount,
    required this.applicationsCount,
    required this.photos,
    required this.createdAt,
  });
}
