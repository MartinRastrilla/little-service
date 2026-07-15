import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';

class PagedServiceRequestsResult {
  final List<ServiceRequestSummary> items;
  final int totalCount;
  final int page;
  final int pageSize;
  final bool hasMore;

  const PagedServiceRequestsResult({
    required this.items,
    required this.totalCount,
    required this.page,
    required this.pageSize,
    required this.hasMore,
  });
}
