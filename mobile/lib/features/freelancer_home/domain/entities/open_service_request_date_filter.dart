enum OpenServiceRequestDateFilter {
  all,
  today,
  week;

  String get apiValue => switch (this) {
        OpenServiceRequestDateFilter.all => 'all',
        OpenServiceRequestDateFilter.today => 'today',
        OpenServiceRequestDateFilter.week => 'week',
      };
}
