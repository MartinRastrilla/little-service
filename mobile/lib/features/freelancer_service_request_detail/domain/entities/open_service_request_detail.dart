class OpenServiceRequestDetailPhoto {
  final String id;
  final String url;

  const OpenServiceRequestDetailPhoto({
    required this.id,
    required this.url,
  });
}

enum OpenServiceRequestPriceMode {
  estimated,
  toBeAgreed;

  static OpenServiceRequestPriceMode fromApi(String value) {
    return switch (value) {
      'Estimated' => OpenServiceRequestPriceMode.estimated,
      _ => OpenServiceRequestPriceMode.toBeAgreed,
    };
  }
}

class OpenServiceRequestClientSummary {
  final String clientId;
  final String clientName;
  final String? clientProfilePictureUrl;
  final String ratingLabel;
  final int publishedJobsCount;

  const OpenServiceRequestClientSummary({
    required this.clientId,
    required this.clientName,
    required this.clientProfilePictureUrl,
    required this.ratingLabel,
    required this.publishedJobsCount,
  });
}

class OpenServiceRequestDetail {
  final String id;
  final String title;
  final String description;
  final String location;
  final String status;
  final String displayStatus;
  final double? price;
  final OpenServiceRequestPriceMode priceMode;
  final int photosCount;
  final int applicationsCount;
  final List<OpenServiceRequestDetailPhoto> photos;
  final DateTime createdAt;
  final bool canApply;
  final bool hasApplied;
  final String? applicationStatus;
  final String? applicationId;
  final OpenServiceRequestClientSummary client;

  const OpenServiceRequestDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.status,
    required this.displayStatus,
    required this.price,
    required this.priceMode,
    required this.photosCount,
    required this.applicationsCount,
    required this.photos,
    required this.createdAt,
    required this.canApply,
    required this.hasApplied,
    required this.applicationStatus,
    required this.applicationId,
    required this.client,
  });
}
