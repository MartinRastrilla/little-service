import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_filter_option.dart';

part 'my_service_requests_event.freezed.dart';

@freezed
sealed class MyServiceRequestsEvent with _$MyServiceRequestsEvent {
  const factory MyServiceRequestsEvent.requested({
    @Default(ServiceRequestFilterOption.all) ServiceRequestFilterOption filter,
    String? search,
    @Default(1) int page,
  }) = MyServiceRequestsRequested;

  const factory MyServiceRequestsEvent.loadMore() = MyServiceRequestsLoadMore;
}
