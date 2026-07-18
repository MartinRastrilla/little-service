import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_summary.dart';

part 'open_service_request_summary_model.freezed.dart';
part 'open_service_request_summary_model.g.dart';

@freezed
abstract class OpenServiceRequestSummaryModel with _$OpenServiceRequestSummaryModel {
  const OpenServiceRequestSummaryModel._();

  const factory OpenServiceRequestSummaryModel({
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
    @Default(0) int applicationsCount,
    String? contractStatus,
    String? coverPhotoUrl,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _OpenServiceRequestSummaryModel;

  factory OpenServiceRequestSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$OpenServiceRequestSummaryModelFromJson(json);

  OpenServiceRequestSummary toEntity() => OpenServiceRequestSummary(
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
        applicationsCount: applicationsCount,
        contractStatus: contractStatus,
        coverPhotoUrl: coverPhotoUrl,
        createdAt: createdAt,
      );
}
