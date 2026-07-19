class FreelancerWorkItem {
  final String id;
  final String title;
  final String location;
  final String status;
  final String displayStatus;
  final double? price;
  final String priceMode;
  final int photosCount;
  final int applicationsCount;
  final String? coverPhotoUrl;
  final DateTime createdAt;

  final String? applicationId;
  final String? applicationStatus;
  final DateTime? applicationCreatedAt;
  final bool canViewApplicationDetail;

  final String? clientName;
  final double? contractAmount;
  final DateTime? contractStartDate;
  final bool hasContract;
  final int unreadMessagesCount;

  const FreelancerWorkItem({
    required this.id,
    required this.title,
    required this.location,
    required this.status,
    required this.displayStatus,
    required this.price,
    required this.priceMode,
    required this.photosCount,
    required this.applicationsCount,
    required this.coverPhotoUrl,
    required this.createdAt,
    this.applicationId,
    this.applicationStatus,
    this.applicationCreatedAt,
    this.canViewApplicationDetail = false,
    this.clientName,
    this.contractAmount,
    this.contractStartDate,
    this.hasContract = false,
    this.unreadMessagesCount = 0,
  });
}

enum FreelancerMyWorkTab { applications, jobs }

enum FreelancerApplicationFilter {
  all,
  pending,
  accepted,
  rejected;

  String get apiValue => switch (this) {
        FreelancerApplicationFilter.all => 'all',
        FreelancerApplicationFilter.pending => 'pending',
        FreelancerApplicationFilter.accepted => 'accepted',
        FreelancerApplicationFilter.rejected => 'rejected',
      };
}

enum FreelancerJobFilter {
  all,
  inProgress,
  completed;

  String get apiValue => switch (this) {
        FreelancerJobFilter.all => 'all',
        FreelancerJobFilter.inProgress => 'inprogress',
        FreelancerJobFilter.completed => 'completed',
      };
}
