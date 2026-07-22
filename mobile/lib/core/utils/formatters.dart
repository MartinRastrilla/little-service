import 'package:intl/intl.dart';
import 'package:mobile/core/config/env.dart';

final _shortDateFormat = DateFormat('d MMM yyyy', 'es_AR');
final _memberSinceMonthYearFormat = DateFormat('MMMM yyyy', 'es_AR');
final _detailDateTimeFormat = DateFormat("d MMM yyyy 'a las' HH:mm", 'es_AR');
final _timelineTimestampFormat = DateFormat('d MMM. HH:mm', 'es_AR');
final _arsPriceFormat = NumberFormat('#,###', 'es_AR');

String formatRelativeTime(DateTime createdAt) {
  final now = DateTime.now();
  final localCreatedAt = createdAt.toLocal();
  final difference = now.difference(localCreatedAt);

  if (difference.inDays >= 1) {
    final days = difference.inDays;
    return days == 1 ? 'Hace 1 día' : 'Hace $days días';
  }

  if (difference.inHours >= 1) {
    final hours = difference.inHours;
    return hours == 1 ? 'Hace 1 hora' : 'Hace $hours horas';
  }

  if (difference.inMinutes >= 1) {
    final minutes = difference.inMinutes;
    return minutes == 1 ? 'Hace 1 minuto' : 'Hace $minutes minutos';
  }

  return 'Hace un momento';
}

String formatShortDate(DateTime date) {
  return _shortDateFormat.format(date.toLocal());
}

String formatMemberSinceMonthYear(DateTime date) {
  final formatted = _memberSinceMonthYearFormat.format(date.toLocal());
  if (formatted.isEmpty) return formatted;
  return formatted[0].toUpperCase() + formatted.substring(1);
}

String formatDetailDateTime(DateTime date) {
  return _detailDateTimeFormat.format(date.toLocal());
}

String formatTimelineTimestamp(DateTime date) {
  return _timelineTimestampFormat.format(date.toLocal());
}

String formatArsPrice(num price) {
  return '\$ ${_arsPriceFormat.format(price)}';
}

String formatYearsOnPlatform(int years) {
  if (years == 1) return '1 año';
  return '$years años';
}

String resolveMediaUrl(String? relativeUrl) {
  if (relativeUrl == null || relativeUrl.isEmpty) {
    return '';
  }

  if (relativeUrl.startsWith('http://') || relativeUrl.startsWith('https://')) {
    return relativeUrl;
  }

  final normalizedPath = relativeUrl.startsWith('/')
      ? relativeUrl
      : '/$relativeUrl';

  return '${Env.mediaBaseUrl}$normalizedPath';
}
