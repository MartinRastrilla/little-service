import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';

part 'service_request_summary_model.freezed.dart';
part 'service_request_summary_model.g.dart';

@freezed
abstract class ServiceRequestSummaryModel with _$ServiceRequestSummaryModel {
  const ServiceRequestSummaryModel._();

  const factory ServiceRequestSummaryModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String title,
    required String description,
    required String location,
    required String status,
    required String displayStatus,
    double? price,
    @JsonKey(fromJson: stringFromJson) required String clientId,
    @JsonKey(fromJson: stringFromJson) String? freelancerPickedId,
    @Default(0) int photosCount,
    String? contractStatus,
    String? coverPhotoUrl,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _ServiceRequestSummaryModel;

  factory ServiceRequestSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestSummaryModelFromJson(json);

  ServiceRequestSummary toEntity() => ServiceRequestSummary(
    id: id,
    title: title,
    description: description,
    location: location,
    status: status,
    displayStatus: displayStatus,
    price: price,
    clientId: clientId,
    freelancerPickedId: freelancerPickedId,
    photosCount: photosCount,
    contractStatus: contractStatus,
    coverPhotoUrl: coverPhotoUrl,
    createdAt: createdAt,
  );
}
