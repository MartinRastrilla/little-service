import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';

part 'service_request_contract_model.freezed.dart';
part 'service_request_contract_model.g.dart';

@freezed
abstract class ServiceRequestContractModel with _$ServiceRequestContractModel {
  const ServiceRequestContractModel._();

  const factory ServiceRequestContractModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(fromJson: stringFromJson) required String serviceRequestId,
    @Default('') String terms,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime startDate,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime endDate,
    required double amount,
    @Default('') String status,
    double? suggestedAmount,
    @Default(false) bool canEdit,
    @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
    DateTime? signedByClientAt,
    @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
    DateTime? signedByFreelancerAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
    @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
    DateTime? updatedAt,
  }) = _ServiceRequestContractModel;

  factory ServiceRequestContractModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestContractModelFromJson(json);

  ServiceRequestContract toEntity() => ServiceRequestContract(
    id: id,
    serviceRequestId: serviceRequestId,
    terms: terms,
    startDate: startDate,
    endDate: endDate,
    amount: amount,
    status: status,
    suggestedAmount: suggestedAmount,
    canEdit: canEdit,
    signedByClientAt: signedByClientAt,
    signedByFreelancerAt: signedByFreelancerAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
