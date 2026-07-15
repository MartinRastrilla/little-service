enum ServiceRequestFilterOption {
  all,
  open,
  inProgress,
  completed,
  cancelled,
}

extension ServiceRequestFilterOptionX on ServiceRequestFilterOption {
  String? get apiValue {
    switch (this) {
      case ServiceRequestFilterOption.all:
        return null;
      case ServiceRequestFilterOption.open:
        return 'open';
      case ServiceRequestFilterOption.inProgress:
        return 'inProgress';
      case ServiceRequestFilterOption.completed:
        return 'completed';
      case ServiceRequestFilterOption.cancelled:
        return 'cancelled';
    }
  }
}
