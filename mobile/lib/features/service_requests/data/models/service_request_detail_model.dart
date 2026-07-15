import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_detail.dart';

part 'service_request_detail_model.freezed.dart';
part 'service_request_detail_model.g.dart';

@freezed
abstract class ServiceRequestPhotoModel with _$ServiceRequestPhotoModel {
  const factory ServiceRequestPhotoModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String filePath,
  }) = _ServiceRequestPhotoModel;

  factory ServiceRequestPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestPhotoModelFromJson(json);
}

@freezed
abstract class ServiceRequestDetailModel with _$ServiceRequestDetailModel {
  const ServiceRequestDetailModel._();

  const factory ServiceRequestDetailModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String title,
    required String description,
    required String location,
    required String status,
    double? price,
    @JsonKey(fromJson: stringFromJson) required String clientId,
    @JsonKey(fromJson: stringFromJson) String? freelancerPickedId,
    @Default(0) int applicationsCount,
    @Default(<ServiceRequestPhotoModel>[]) List<ServiceRequestPhotoModel> photos,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
    @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)
    DateTime? updatedAt,
  }) = _ServiceRequestDetailModel;

  factory ServiceRequestDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestDetailModelFromJson(json);

  ServiceRequestDetail toEntity() => ServiceRequestDetail(
    id: id,
    title: title,
    description: description,
    location: location,
    status: status,
    price: price,
    clientId: clientId,
    freelancerPickedId: freelancerPickedId,
    applicationsCount: applicationsCount,
    photoUrls: photos.map((photo) => photo.filePath).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt,
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
