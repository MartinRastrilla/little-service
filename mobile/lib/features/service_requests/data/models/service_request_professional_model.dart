import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_professional.dart';

part 'service_request_professional_model.freezed.dart';
part 'service_request_professional_model.g.dart';

@freezed
abstract class ServiceRequestContractSummaryModel
    with _$ServiceRequestContractSummaryModel {
  const ServiceRequestContractSummaryModel._();

  const factory ServiceRequestContractSummaryModel({
    @Default(false) bool hasContract,
    @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)
    DateTime? startDate,
    double? amount,
    String? status,
    String? displayStatus,
  }) = _ServiceRequestContractSummaryModel;

  factory ServiceRequestContractSummaryModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ServiceRequestContractSummaryModelFromJson(json);

  ServiceRequestContractSummary toEntity() => ServiceRequestContractSummary(
    hasContract: hasContract,
    startDate: startDate,
    amount: amount,
    status: status,
    displayStatus: displayStatus,
  );
}

@freezed
abstract class ServiceRequestProfessionalActionsModel
    with _$ServiceRequestProfessionalActionsModel {
  const ServiceRequestProfessionalActionsModel._();

  const factory ServiceRequestProfessionalActionsModel({
    @Default(false) bool canRevokeEngagement,
    String? revokeEngagementBlockedReason,
    @Default(false) bool canOpenProfile,
    @Default(false) bool canOpenChat,
    @Default(false) bool canCall,
    @Default(false) bool canViewContract,
    @Default(false) bool canCreateContract,
    @Default(false) bool canEditContract,
  }) = _ServiceRequestProfessionalActionsModel;

  factory ServiceRequestProfessionalActionsModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ServiceRequestProfessionalActionsModelFromJson(json);

  ServiceRequestProfessionalActions toEntity() =>
      ServiceRequestProfessionalActions(
        canRevokeEngagement: canRevokeEngagement,
        revokeEngagementBlockedReason: revokeEngagementBlockedReason,
        canOpenProfile: canOpenProfile,
        canOpenChat: canOpenChat,
        canCall: canCall,
        canViewContract: canViewContract,
        canCreateContract: canCreateContract,
        canEditContract: canEditContract,
      );
}

@freezed
abstract class ServiceRequestProfessionalModel
    with _$ServiceRequestProfessionalModel {
  const ServiceRequestProfessionalModel._();

  const factory ServiceRequestProfessionalModel({
    @Default(false) bool hasAssignedProfessional,
    @JsonKey(fromJson: stringFromJson) String? freelancerId,
    @Default('') String serviceLocation,
    @Default('') String displayStatus,
    @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)
    DateTime? selectedAt,
    @Default(ServiceRequestContractSummaryModel())
    ServiceRequestContractSummaryModel contractSummary,
    @Default(ServiceRequestProfessionalActionsModel())
    ServiceRequestProfessionalActionsModel actions,
  }) = _ServiceRequestProfessionalModel;

  factory ServiceRequestProfessionalModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestProfessionalModelFromJson(json);

  ServiceRequestProfessional toEntity() => ServiceRequestProfessional(
    hasAssignedProfessional: hasAssignedProfessional,
    freelancerId: freelancerId,
    serviceLocation: serviceLocation,
    displayStatus: displayStatus,
    selectedAt: selectedAt,
    contractSummary: contractSummary.toEntity(),
    actions: actions.toEntity(),
  );
}

DateTime? _nullableDateTimeFromJson(Object? value) {
  if (value == null) return null;
  if (value is String && value.isEmpty) return null;
  return dateTimeFromJson(value);
}

Object? _nullableDateTimeToJson(DateTime? value) =>
    value == null ? null : dateTimeToJson(value);
