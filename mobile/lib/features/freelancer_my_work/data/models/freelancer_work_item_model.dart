import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/json_converters.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';

part 'freelancer_work_item_model.freezed.dart';
part 'freelancer_work_item_model.g.dart';

@freezed
abstract class FreelancerWorkItemModel with _$FreelancerWorkItemModel {
  const FreelancerWorkItemModel._();

  const factory FreelancerWorkItemModel({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String title,
    required String location,
    required String status,
    required String displayStatus,
    double? price,
    @Default('ToBeAgreed') String priceMode,
    @Default(0) int photosCount,
    @Default(0) int applicationsCount,
    String? coverPhotoUrl,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
    @JsonKey(fromJson: stringFromJson) String? applicationId,
    String? applicationStatus,
    @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
    DateTime? applicationCreatedAt,
    @Default(false) bool canViewApplicationDetail,
    String? clientName,
    double? contractAmount,
    @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
    DateTime? contractStartDate,
    @Default(false) bool hasContract,
    @Default(0) int unreadMessagesCount,
  }) = _FreelancerWorkItemModel;

  factory FreelancerWorkItemModel.fromJson(Map<String, dynamic> json) =>
      _$FreelancerWorkItemModelFromJson(json);

  FreelancerWorkItem toEntity() => FreelancerWorkItem(
        id: id,
        title: title,
        location: location,
        status: status,
        displayStatus: displayStatus,
        price: price,
        priceMode: priceMode,
        photosCount: photosCount,
        applicationsCount: applicationsCount,
        coverPhotoUrl: coverPhotoUrl,
        createdAt: createdAt,
        applicationId: applicationId,
        applicationStatus: applicationStatus,
        applicationCreatedAt: applicationCreatedAt,
        canViewApplicationDetail: canViewApplicationDetail,
        clientName: clientName,
        contractAmount: contractAmount,
        contractStartDate: contractStartDate,
        hasContract: hasContract,
        unreadMessagesCount: unreadMessagesCount,
      );
}
