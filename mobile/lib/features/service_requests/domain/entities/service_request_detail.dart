class ServiceRequestDetail {
  final String id;
  final String title;
  final String description;
  final String location;
  final String status;
  final double? price;
  final String clientId;
  final String? freelancerPickedId;
  final int applicationsCount;
  final List<String> photoUrls;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const ServiceRequestDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.status,
    required this.price,
    required this.clientId,
    required this.freelancerPickedId,
    required this.applicationsCount,
    required this.photoUrls,
    required this.createdAt,
    required this.updatedAt,
  });
}
