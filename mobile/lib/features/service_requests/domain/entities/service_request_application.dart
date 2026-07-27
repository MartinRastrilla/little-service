class ServiceRequestApplication {
  final String id;
  final String freelancerId;
  final String freelancerName;
  final String? profilePictureUrl;
  final double ratingAverage;
  final int ratingCount;
  final String? bio;
  final String status;
  final String displayStatus;
  final DateTime createdAt;

  const ServiceRequestApplication({
    required this.id,
    required this.freelancerId,
    required this.freelancerName,
    required this.profilePictureUrl,
    required this.ratingAverage,
    required this.ratingCount,
    required this.bio,
    required this.status,
    required this.displayStatus,
    required this.createdAt,
  });

  bool get isPending => status.toLowerCase() == 'pending';
}

class ServiceRequestApplicationsResult {
  final List<ServiceRequestApplication> applications;
  final bool canManageApplications;
  final String serviceRequestTitle;
  final String serviceRequestDisplayStatus;

  const ServiceRequestApplicationsResult({
    required this.applications,
    required this.canManageApplications,
    required this.serviceRequestTitle,
    required this.serviceRequestDisplayStatus,
  });
}

enum ServiceRequestApplicationFilter {
  pending,
  all,
}
