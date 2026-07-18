import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';

part 'freelancer_home_event.freezed.dart';

@freezed
sealed class FreelancerHomeEvent with _$FreelancerHomeEvent {
  const factory FreelancerHomeEvent.requested({
    @Default(OpenServiceRequestDateFilter.all)
    OpenServiceRequestDateFilter filter,
    String? search,
  }) = FreelancerHomeRequested;
}
