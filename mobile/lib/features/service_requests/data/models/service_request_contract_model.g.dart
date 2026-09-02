// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRequestContractModel _$ServiceRequestContractModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRequestContractModel(
  id: stringFromJson(json['id']),
  serviceRequestId: stringFromJson(json['serviceRequestId']),
  terms: json['terms'] as String? ?? '',
  startDate: dateTimeFromJson(json['startDate']),
  endDate: dateTimeFromJson(json['endDate']),
  amount: (json['amount'] as num).toDouble(),
  status: json['status'] as String? ?? '',
  suggestedAmount: (json['suggestedAmount'] as num?)?.toDouble(),
  canEdit: json['canEdit'] as bool? ?? false,
  canSign: json['canSign'] as bool? ?? false,
  canCancelPartial: json['canCancelPartial'] as bool? ?? false,
  signedByClientAt: nullableDateTimeFromJson(json['signedByClientAt']),
  signedByFreelancerAt: nullableDateTimeFromJson(json['signedByFreelancerAt']),
  createdAt: dateTimeFromJson(json['createdAt']),
  updatedAt: nullableDateTimeFromJson(json['updatedAt']),
);

Map<String, dynamic> _$ServiceRequestContractModelToJson(
  _ServiceRequestContractModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'serviceRequestId': instance.serviceRequestId,
  'terms': instance.terms,
  'startDate': dateTimeToJson(instance.startDate),
  'endDate': dateTimeToJson(instance.endDate),
  'amount': instance.amount,
  'status': instance.status,
  'suggestedAmount': instance.suggestedAmount,
  'canEdit': instance.canEdit,
  'canSign': instance.canSign,
  'canCancelPartial': instance.canCancelPartial,
  'signedByClientAt': nullableDateTimeToJson(instance.signedByClientAt),
  'signedByFreelancerAt': nullableDateTimeToJson(instance.signedByFreelancerAt),
  'createdAt': dateTimeToJson(instance.createdAt),
  'updatedAt': nullableDateTimeToJson(instance.updatedAt),
};
