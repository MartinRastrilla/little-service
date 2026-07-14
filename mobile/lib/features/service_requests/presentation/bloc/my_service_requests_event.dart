import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_service_requests_event.freezed.dart';

@freezed
sealed class MyServiceRequestsEvent with _$MyServiceRequestsEvent {
  const factory MyServiceRequestsEvent.requested() = MyServiceRequestsRequested;
}
