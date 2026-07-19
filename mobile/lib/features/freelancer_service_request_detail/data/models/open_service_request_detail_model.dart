import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/entities/open_service_request_detail.dart';

part 'open_service_request_detail_model.freezed.dart';
part 'open_service_request_detail_model.g.dart';

@freezed
abstract class OpenServiceRequestClientSummaryModel
    with _$OpenServiceRequestClientSummaryModel {
  const OpenServiceRequestClientSummaryModel._();

  const factory OpenServiceRequestClientSummaryModel({
    @JsonKey(fromJson: stringFromJson) required String clientId,
    required String clientName,
    String? clientProfilePictureUrl,
    required String ratingLabel,
    @Default(0) int publishedJobsCount,
  }) = _OpenServiceRequestClientSummaryModel;

  factory OpenServiceRequestClientSummaryModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OpenServiceRequestClientSummaryModelFromJson(json);

  OpenServiceRequestClientSummary toEntity() => OpenServiceRequestClientSummary(
        clientId: clientId,
        clientName: clientName,
        clientProfilePictureUrl: clientProfilePictureUrl,
        ratingLabel: ratingLabel,
        publishedJobsCount: publishedJobsCount,
      );
}

@freezed
abstract class OpenServiceRequestDetailPhotoModel
    with _$OpenServiceRequestDetailPhotoModel {
  const OpenServiceRequestDetailPhotoModel._();

  const factory OpenServiceRequestDetailPhotoModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(name: 'filePath') required String url,
  }) = _OpenServiceRequestDetailPhotoModel;

  factory OpenServiceRequestDetailPhotoModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OpenServiceRequestDetailPhotoModelFromJson(json);

  OpenServiceRequestDetailPhoto toEntity() => OpenServiceRequestDetailPhoto(
        id: id,
        url: url,
      );
}

@freezed
abstract class OpenServiceRequestDetailModel with _$OpenServiceRequestDetailModel {
  const OpenServiceRequestDetailModel._();

  const factory OpenServiceRequestDetailModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String title,
    required String description,
    required String location,
    required String status,
    required String displayStatus,
    double? price,
    required String priceMode,
    @Default(0) int photosCount,
    @Default(0) int applicationsCount,
    @Default([]) List<OpenServiceRequestDetailPhotoModel> photos,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
    @Default(false) bool canApply,
    @Default(false) bool hasApplied,
    String? applicationStatus,
    @JsonKey(fromJson: stringFromJson) String? applicationId,
    required OpenServiceRequestClientSummaryModel client,
  }) = _OpenServiceRequestDetailModel;

  factory OpenServiceRequestDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OpenServiceRequestDetailModelFromJson(json);

  OpenServiceRequestDetail toEntity() => OpenServiceRequestDetail(
        id: id,
        title: title,
        description: description,
        location: location,
        status: status,
        displayStatus: displayStatus,
        price: price,
        priceMode: OpenServiceRequestPriceMode.fromApi(priceMode),
        photosCount: photosCount,
        applicationsCount: applicationsCount,
        photos: photos.map((photo) => photo.toEntity()).toList(),
        createdAt: createdAt,
        canApply: canApply,
        hasApplied: hasApplied,
        applicationStatus: applicationStatus,
        applicationId: applicationId,
        client: client.toEntity(),
      );
}
