class ConversationSummary {
  final String serviceRequestId;
  final String withUserId;
  final String withUserName;
  final String? lastMessageContent;
  final DateTime? lastMessageAt;
  final int unreadCount;

  const ConversationSummary({
    required this.serviceRequestId,
    required this.withUserId,
    required this.withUserName,
    this.lastMessageContent,
    this.lastMessageAt,
    required this.unreadCount,
  });
}
