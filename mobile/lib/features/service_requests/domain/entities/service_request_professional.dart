class ServiceRequestContractSummary {
  final bool hasContract;
  final DateTime? startDate;
  final double? amount;
  final String? status;
  final String? displayStatus;

  const ServiceRequestContractSummary({
    required this.hasContract,
    this.startDate,
    this.amount,
    this.status,
    this.displayStatus,
  });
}

class ServiceRequestProfessionalActions {
  final bool canRevokeEngagement;
  final String? revokeEngagementBlockedReason;
  final bool canOpenProfile;
  final bool canOpenChat;
  final bool canCall;
  final bool canViewContract;

  const ServiceRequestProfessionalActions({
    required this.canRevokeEngagement,
    this.revokeEngagementBlockedReason,
    required this.canOpenProfile,
    required this.canOpenChat,
    required this.canCall,
    required this.canViewContract,
  });
}

class ServiceRequestProfessional {
  final bool hasAssignedProfessional;
  final String? freelancerId;
  final String serviceLocation;
  final String displayStatus;
  final DateTime? selectedAt;
  final ServiceRequestContractSummary contractSummary;
  final ServiceRequestProfessionalActions actions;

  const ServiceRequestProfessional({
    required this.hasAssignedProfessional,
    this.freelancerId,
    required this.serviceLocation,
    required this.displayStatus,
    this.selectedAt,
    required this.contractSummary,
    required this.actions,
  });
}
