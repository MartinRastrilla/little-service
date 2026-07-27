import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';

part 'service_request_application_model.freezed.dart';
part 'service_request_application_model.g.dart';

@freezed
abstract class ServiceRequestApplicationModel with _$ServiceRequestApplicationModel {
  const ServiceRequestApplicationModel._();

  const factory ServiceRequestApplicationModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(fromJson: stringFromJson) required String freelancerId,
    required String freelancerName,
    String? freelancerProfilePicture,
    required double ratingAverage,
    @Default(0) int ratingCount,
    String? bio,
    required String status,
    @Default('') String displayStatus,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _ServiceRequestApplicationModel;

  factory ServiceRequestApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestApplicationModelFromJson(json);

  ServiceRequestApplication toEntity() => ServiceRequestApplication(
        id: id,
        freelancerId: freelancerId,
        freelancerName: freelancerName,
        profilePictureUrl: freelancerProfilePicture,
        ratingAverage: ratingAverage,
        ratingCount: ratingCount,
        bio: bio,
        status: status,
        displayStatus: displayStatus.isNotEmpty
            ? displayStatus
            : _fallbackDisplayStatus(status),
        createdAt: createdAt,
      );

  static String _fallbackDisplayStatus(String status) {
    return switch (status.toLowerCase()) {
      'pending' => 'Esperando respuesta',
      'accepted' => 'Aceptada',
      'rejected' => 'No seleccionada',
      _ => status,
    };
  }
}

@freezed
abstract class ServiceRequestApplicationsResultModel
    with _$ServiceRequestApplicationsResultModel {
  const ServiceRequestApplicationsResultModel._();

  const factory ServiceRequestApplicationsResultModel({
    @Default(<ServiceRequestApplicationModel>[])
    List<ServiceRequestApplicationModel> applications,
    @Default(false) bool canManageApplications,
    @Default('') String serviceRequestTitle,
    @Default('') String serviceRequestDisplayStatus,
  }) = _ServiceRequestApplicationsResultModel;

  factory ServiceRequestApplicationsResultModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ServiceRequestApplicationsResultModelFromJson(json);

  ServiceRequestApplicationsResult toEntity() => ServiceRequestApplicationsResult(
        applications: applications.map((item) => item.toEntity()).toList(),
        canManageApplications: canManageApplications,
        serviceRequestTitle: serviceRequestTitle,
        serviceRequestDisplayStatus: serviceRequestDisplayStatus,
      );
}
