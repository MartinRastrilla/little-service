import 'package:mobile/features/chat/domain/entities/chat_message.dart';

class PagedMessages {
  final List<ChatMessage> items;
  final DateTime? nextCursor;
  final bool hasMore;

  const PagedMessages({
    required this.items,
    this.nextCursor,
    required this.hasMore,
  });
}
