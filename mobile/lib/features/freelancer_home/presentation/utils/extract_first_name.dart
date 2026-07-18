String extractFirstName(String fullName) {
  final trimmed = fullName.trim();
  if (trimmed.isEmpty) return fullName;

  final parts = trimmed.split(RegExp(r'\s+'));
  return parts.first;
}
