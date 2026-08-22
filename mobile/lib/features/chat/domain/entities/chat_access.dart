class ChatAccess {
  final bool canOpen;
  final bool canSend;
  final bool isReadOnly;
  final bool waitingForClientMessage;
  final String? blockedReason;

  const ChatAccess({
    required this.canOpen,
    required this.canSend,
    required this.isReadOnly,
    required this.waitingForClientMessage,
    this.blockedReason,
  });
}
