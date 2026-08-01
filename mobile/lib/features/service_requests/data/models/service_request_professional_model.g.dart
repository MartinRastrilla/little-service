// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_professional_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRequestContractSummaryModel
_$ServiceRequestContractSummaryModelFromJson(Map<String, dynamic> json) =>
    _ServiceRequestContractSummaryModel(
      hasContract: json['hasContract'] as bool? ?? false,
      startDate: _nullableDateTimeFromJson(json['startDate']),
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      displayStatus: json['displayStatus'] as String?,
    );

Map<String, dynamic> _$ServiceRequestContractSummaryModelToJson(
  _ServiceRequestContractSummaryModel instance,
) => <String, dynamic>{
  'hasContract': instance.hasContract,
  'startDate': _nullableDateTimeToJson(instance.startDate),
  'amount': instance.amount,
  'status': instance.status,
  'displayStatus': instance.displayStatus,
};

_ServiceRequestProfessionalActionsModel
_$ServiceRequestProfessionalActionsModelFromJson(Map<String, dynamic> json) =>
    _ServiceRequestProfessionalActionsModel(
      canRevokeEngagement: json['canRevokeEngagement'] as bool? ?? false,
      revokeEngagementBlockedReason:
          json['revokeEngagementBlockedReason'] as String?,
      canOpenProfile: json['canOpenProfile'] as bool? ?? false,
      canOpenChat: json['canOpenChat'] as bool? ?? false,
      canCall: json['canCall'] as bool? ?? false,
      canViewContract: json['canViewContract'] as bool? ?? false,
    );

Map<String, dynamic> _$ServiceRequestProfessionalActionsModelToJson(
  _ServiceRequestProfessionalActionsModel instance,
) => <String, dynamic>{
  'canRevokeEngagement': instance.canRevokeEngagement,
  'revokeEngagementBlockedReason': instance.revokeEngagementBlockedReason,
  'canOpenProfile': instance.canOpenProfile,
  'canOpenChat': instance.canOpenChat,
  'canCall': instance.canCall,
  'canViewContract': instance.canViewContract,
};

_ServiceRequestProfessionalModel _$ServiceRequestProfessionalModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestProfessionalModel(
  hasAssignedProfessional: json['hasAssignedProfessional'] as bool? ?? false,
  freelancerId: stringFromJson(json['freelancerId']),
  serviceLocation: json['serviceLocation'] as String? ?? '',
  displayStatus: json['displayStatus'] as String? ?? '',
  selectedAt: _nullableDateTimeFromJson(json['selectedAt']),
  contractSummary:
      json['contractSummary'] == null
          ? const ServiceRequestContractSummaryModel()
          : ServiceRequestContractSummaryModel.fromJson(
            json['contractSummary'] as Map<String, dynamic>,
          ),
  actions:
      json['actions'] == null
          ? const ServiceRequestProfessionalActionsModel()
          : ServiceRequestProfessionalActionsModel.fromJson(
            json['actions'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$ServiceRequestProfessionalModelToJson(
  _ServiceRequestProfessionalModel instance,
) => <String, dynamic>{
  'hasAssignedProfessional': instance.hasAssignedProfessional,
  'freelancerId': instance.freelancerId,
  'serviceLocation': instance.serviceLocation,
  'displayStatus': instance.displayStatus,
  'selectedAt': _nullableDateTimeToJson(instance.selectedAt),
  'contractSummary': instance.contractSummary,
  'actions': instance.actions,
};
