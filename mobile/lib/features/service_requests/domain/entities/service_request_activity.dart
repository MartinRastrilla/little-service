class ServiceRequestTimelineStep {
  final String key;
  final String title;
  final String subtitle;
  final String status;
  final DateTime? occurredAt;

  const ServiceRequestTimelineStep({
    required this.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.occurredAt,
  });
}

class ServiceRequestRecentApplication {
  final String id;
  final String freelancerName;
  final String? profilePictureUrl;
  final double ratingAverage;
  final int ratingCount;
  final DateTime createdAt;

  const ServiceRequestRecentApplication({
    required this.id,
    required this.freelancerName,
    required this.profilePictureUrl,
    required this.ratingAverage,
    required this.ratingCount,
    required this.createdAt,
  });
}

class ServiceRequestActivity {
  final int messagesCount;
  final int applicationsCount;
  final bool showRecentApplications;
  final List<ServiceRequestTimelineStep> timeline;
  final List<ServiceRequestRecentApplication> recentApplications;

  const ServiceRequestActivity({
    required this.messagesCount,
    required this.applicationsCount,
    required this.showRecentApplications,
    required this.timeline,
    required this.recentApplications,
  });
}
