import 'dart:async';

import 'package:mobile/core/config/env.dart';
import 'package:mobile/features/chat/data/models/chat_message_model.dart';
import 'package:mobile/features/chat/data/models/messages_read_event_model.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';
import 'package:signalr_netcore/signalr_client.dart';

class ChatSignalRService {
  HubConnection? _connection;
  String? _serviceRequestId;
  String? _withUserId;

  final StreamController<ChatMessage> _messageController =
      StreamController<ChatMessage>.broadcast();
  final StreamController<MessagesReadEventModel> _messagesReadController =
      StreamController<MessagesReadEventModel>.broadcast();

  Stream<ChatMessage> get onMessageReceived => _messageController.stream;
  Stream<MessagesReadEventModel> get onMessagesRead =>
      _messagesReadController.stream;

  Future<void> connect(String accessToken) async {
    if (_connection?.state == HubConnectionState.Connected) return;

    await disconnect();

    final hubUrl = '${Env.hubUrl}?access_token=$accessToken';
    _connection = HubConnectionBuilder()
        .withUrl(
          hubUrl,
          options: HttpConnectionOptions(
            accessTokenFactory: () async => accessToken,
          ),
        )
        .withAutomaticReconnect()
        .build();

    _connection!.on('MessageReceived', (arguments) {
      final payload = _asStringMap(arguments?.firstOrNull);
      if (payload == null) return;
      try {
        final model = ChatMessageModel.fromJson(payload);
        _messageController.add(model.toEntity());
      } catch (_) {}
    });

    _connection!.on('MessagesRead', (arguments) {
      final payload = _asStringMap(arguments?.firstOrNull);
      if (payload == null) return;
      try {
        _messagesReadController.add(MessagesReadEventModel.fromJson(payload));
      } catch (_) {}
    });

    await _connection!.start();
  }

  Future<void> joinThread({
    required String serviceRequestId,
    required String withUserId,
  }) async {
    _serviceRequestId = serviceRequestId;
    _withUserId = withUserId;
    final connection = _connection;
    if (connection?.state != HubConnectionState.Connected) return;
    await connection!.invoke('JoinThread', args: [serviceRequestId, withUserId]);
  }

  Future<void> leaveThread() async {
    final connection = _connection;
    final serviceRequestId = _serviceRequestId;
    final withUserId = _withUserId;
    if (connection?.state != HubConnectionState.Connected ||
        serviceRequestId == null ||
        withUserId == null) {
      return;
    }
    try {
      await connection!.invoke(
        'LeaveThread',
        args: [serviceRequestId, withUserId],
      );
    } catch (_) {}
    _serviceRequestId = null;
    _withUserId = null;
  }

  Future<void> disconnect() async {
    await leaveThread();
    final connection = _connection;
    _connection = null;
    if (connection != null) {
      try {
        await connection.stop();
      } catch (_) {}
    }
  }

  void dispose() {
    disconnect();
    _messageController.close();
    _messagesReadController.close();
  }
}

extension _FirstOrNull<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

Map<String, dynamic>? _asStringMap(dynamic value) {
  if (value is Map<String, dynamic>) return value;
  if (value is Map) {
    return value.map(
      (key, nestedValue) => MapEntry(key.toString(), nestedValue),
    );
  }
  return null;
}
