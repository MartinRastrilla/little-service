class ChatMessage {
  final String id;
  final String fromUserId;
  final String toUserId;
  final String serviceRequestId;
  final String content;
  final DateTime createdAt;
  final bool isRead;

  const ChatMessage({
    required this.id,
    required this.fromUserId,
    required this.toUserId,
    required this.serviceRequestId,
    required this.content,
    required this.createdAt,
    required this.isRead,
  });
}
