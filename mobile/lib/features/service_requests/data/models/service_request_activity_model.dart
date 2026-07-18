import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_activity.dart';

part 'service_request_activity_model.freezed.dart';
part 'service_request_activity_model.g.dart';

@freezed
abstract class ServiceRequestTimelineStepModel with _$ServiceRequestTimelineStepModel {
  const factory ServiceRequestTimelineStepModel({
    required String key,
    required String title,
    required String subtitle,
    required String status,
    @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)
    DateTime? occurredAt,
  }) = _ServiceRequestTimelineStepModel;

  factory ServiceRequestTimelineStepModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestTimelineStepModelFromJson(json);
}

@freezed
abstract class ServiceRequestRecentApplicationModel
    with _$ServiceRequestRecentApplicationModel {
  const factory ServiceRequestRecentApplicationModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String freelancerName,
    String? freelancerProfilePicture,
    required double ratingAverage,
    @Default(0) int ratingCount,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _ServiceRequestRecentApplicationModel;

  factory ServiceRequestRecentApplicationModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ServiceRequestRecentApplicationModelFromJson(json);
}

@freezed
abstract class ServiceRequestActivityModel with _$ServiceRequestActivityModel {
  const ServiceRequestActivityModel._();

  const factory ServiceRequestActivityModel({
    @Default(0) int messagesCount,
    @Default(0) int applicationsCount,
    @Default(false) bool showRecentApplications,
    @Default(<ServiceRequestTimelineStepModel>[])
    List<ServiceRequestTimelineStepModel> timeline,
    @Default(<ServiceRequestRecentApplicationModel>[])
    List<ServiceRequestRecentApplicationModel> recentApplications,
  }) = _ServiceRequestActivityModel;

  factory ServiceRequestActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestActivityModelFromJson(json);

  ServiceRequestActivity toEntity() => ServiceRequestActivity(
    messagesCount: messagesCount,
    applicationsCount: applicationsCount,
    showRecentApplications: showRecentApplications,
    timeline: timeline
        .map(
          (step) => ServiceRequestTimelineStep(
            key: step.key,
            title: step.title,
            subtitle: step.subtitle,
            status: step.status,
            occurredAt: step.occurredAt,
          ),
        )
        .toList(),
    recentApplications: recentApplications
        .map(
          (application) => ServiceRequestRecentApplication(
            id: application.id,
            freelancerName: application.freelancerName,
            profilePictureUrl: application.freelancerProfilePicture,
            ratingAverage: application.ratingAverage,
            ratingCount: application.ratingCount,
            createdAt: application.createdAt,
          ),
        )
        .toList(),
  );
}

DateTime? _nullableDateTimeFromJson(Object? value) {
  if (value == null) return null;
  return dateTimeFromJson(value);
}

Object? _nullableDateTimeToJson(DateTime? value) {
  if (value == null) return null;
  return dateTimeToJson(value);
}
