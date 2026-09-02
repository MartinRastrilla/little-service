class ServiceRequestContract {
  final String id;
  final String serviceRequestId;
  final String terms;
  final DateTime startDate;
  final DateTime endDate;
  final double amount;
  final String status;
  final double? suggestedAmount;
  final bool canEdit;
  final DateTime? signedByClientAt;
  final DateTime? signedByFreelancerAt;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const ServiceRequestContract({
    required this.id,
    required this.serviceRequestId,
    required this.terms,
    required this.startDate,
    required this.endDate,
    required this.amount,
    required this.status,
    this.suggestedAmount,
    required this.canEdit,
    this.signedByClientAt,
    this.signedByFreelancerAt,
    required this.createdAt,
    this.updatedAt,
  });
}

class UpsertContractParams {
  final String serviceRequestId;
  final String terms;
  final DateTime startDate;
  final DateTime endDate;
  final double amount;

  const UpsertContractParams({
    required this.serviceRequestId,
    required this.terms,
    required this.startDate,
    required this.endDate,
    required this.amount,
  });
}
