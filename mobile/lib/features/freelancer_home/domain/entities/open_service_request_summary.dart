class OpenServiceRequestSummary {
  final String id;
  final String title;
  final String description;
  final String location;
  final String status;
  final String displayStatus;
  final double? price;
  final String clientId;
  final String? freelancerPickedId;
  final int photosCount;
  final int applicationsCount;
  final String? contractStatus;
  final String? coverPhotoUrl;
  final DateTime createdAt;

  const OpenServiceRequestSummary({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.status,
    required this.displayStatus,
    required this.price,
    required this.clientId,
    required this.freelancerPickedId,
    required this.photosCount,
    required this.applicationsCount,
    required this.contractStatus,
    required this.coverPhotoUrl,
    required this.createdAt,
  });
}
