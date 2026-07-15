// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_service_requests_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PagedServiceRequestsResultModel _$PagedServiceRequestsResultModelFromJson(
  Map<String, dynamic> json,
) => _PagedServiceRequestsResultModel(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                ServiceRequestSummaryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ServiceRequestSummaryModel>[],
  totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
  hasMore: json['hasMore'] as bool? ?? false,
);

Map<String, dynamic> _$PagedServiceRequestsResultModelToJson(
  _PagedServiceRequestsResultModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'totalCount': instance.totalCount,
  'page': instance.page,
  'pageSize': instance.pageSize,
  'hasMore': instance.hasMore,
};
