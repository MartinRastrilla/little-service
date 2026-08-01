import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';

part 'service_request_info_model.freezed.dart';
part 'service_request_info_model.g.dart';

@freezed
abstract class ServiceRequestInfoPhotoModel with _$ServiceRequestInfoPhotoModel {
  const factory ServiceRequestInfoPhotoModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String filePath,
  }) = _ServiceRequestInfoPhotoModel;

  factory ServiceRequestInfoPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestInfoPhotoModelFromJson(json);
}

@freezed
abstract class ServiceRequestInfoModel with _$ServiceRequestInfoModel {
  const ServiceRequestInfoModel._();

  const factory ServiceRequestInfoModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String title,
    required String description,
    required String location,
    required String status,
    required String displayStatus,
    String? contractStatus,
    double? price,
    required String priceMode,
    @Default(false) bool isEditable,
    @Default(false) bool canCancel,
    String? cancelBlockedReason,
    String? editBlockedReason,
    @Default(0) int messagesCount,
    @Default(0) int applicationsCount,
    @Default(<ServiceRequestInfoPhotoModel>[])
    List<ServiceRequestInfoPhotoModel> photos,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _ServiceRequestInfoModel;

  factory ServiceRequestInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestInfoModelFromJson(json);

  ServiceRequestInfo toEntity() => ServiceRequestInfo(
    id: id,
    title: title,
    description: description,
    location: location,
    status: status,
    displayStatus: displayStatus,
    contractStatus: contractStatus,
    price: price,
    priceMode: ServiceRequestPriceMode.fromApi(priceMode),
    isEditable: isEditable,
    canCancel: canCancel,
    cancelBlockedReason: cancelBlockedReason,
    editBlockedReason: editBlockedReason,
    messagesCount: messagesCount,
    applicationsCount: applicationsCount,
    photos: photos
        .map(
          (photo) => ServiceRequestInfoPhoto(
            id: photo.id,
            url: photo.filePath,
          ),
        )
        .toList(),
    createdAt: createdAt,
  );
}
