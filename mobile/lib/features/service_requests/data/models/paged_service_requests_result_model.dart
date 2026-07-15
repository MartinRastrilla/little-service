import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/data/models/service_request_summary_model.dart';
import 'package:mobile/features/service_requests/domain/entities/paged_service_requests_result.dart';

part 'paged_service_requests_result_model.freezed.dart';
part 'paged_service_requests_result_model.g.dart';

@freezed
abstract class PagedServiceRequestsResultModel
    with _$PagedServiceRequestsResultModel {
  const PagedServiceRequestsResultModel._();

  const factory PagedServiceRequestsResultModel({
    @Default(<ServiceRequestSummaryModel>[]) List<ServiceRequestSummaryModel> items,
    @Default(0) int totalCount,
    @Default(1) int page,
    @Default(20) int pageSize,
    @Default(false) bool hasMore,
  }) = _PagedServiceRequestsResultModel;

  factory PagedServiceRequestsResultModel.fromJson(Map<String, dynamic> json) =>
      _$PagedServiceRequestsResultModelFromJson(json);

  PagedServiceRequestsResult toEntity() => PagedServiceRequestsResult(
    items: items.map((item) => item.toEntity()).toList(),
    totalCount: totalCount,
    page: page,
    pageSize: pageSize,
    hasMore: hasMore,
  );
}
