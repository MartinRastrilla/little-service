import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/network/token_storage.dart';
import 'package:mobile/features/chat/data/services/chat_signalr_service.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';
import 'package:mobile/features/chat/domain/usecases/get_chat_access_usecase.dart';
import 'package:mobile/features/chat/domain/usecases/get_chat_messages_usecase.dart';
import 'package:mobile/features/chat/domain/usecases/get_service_request_conversations_usecase.dart';
import 'package:mobile/features/chat/domain/usecases/mark_chat_as_read_usecase.dart';
import 'package:mobile/features/chat/domain/usecases/send_chat_message_usecase.dart';
import 'package:mobile/features/chat/presentation/bloc/chat_event.dart';
import 'package:mobile/features/chat/presentation/bloc/chat_state.dart';
import 'package:mobile/features/chat/presentation/mappers/chat_error_mapper.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatAccessUseCase getChatAccessUseCase;
  final GetChatMessagesUseCase getChatMessagesUseCase;
  final SendChatMessageUseCase sendChatMessageUseCase;
  final MarkChatAsReadUseCase markChatAsReadUseCase;
  final GetServiceRequestConversationsUseCase getConversationsUseCase;
  final ChatSignalRService signalRService;
  final TokenStorage tokenStorage;

  StreamSubscription<ChatMessage>? _messageSubscription;
  StreamSubscription<dynamic>? _messagesReadSubscription;

  ChatBloc({
    required this.getChatAccessUseCase,
    required this.getChatMessagesUseCase,
    required this.sendChatMessageUseCase,
    required this.markChatAsReadUseCase,
    required this.getConversationsUseCase,
    required this.signalRService,
    required this.tokenStorage,
  }) : super(const ChatState.loading()) {
    on<ChatOpened>(_onOpened);
    on<ChatSendMessage>(_onSendMessage);
    on<ChatLoadOlderMessages>(_onLoadOlderMessages);
    on<ChatMessageReceived>(_onMessageReceived);
    on<ChatMessagesRead>(_onMessagesRead);
    on<ChatClosed>(_onClosed);
  }

  Future<void> _onOpened(ChatOpened event, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());

    var withUserId = event.withUserId;
    var interlocutorName = event.interlocutorName;

    if (withUserId == null) {
      final conversationsResult =
          await getConversationsUseCase(event.serviceRequestId);
      final resolved = conversationsResult.fold(
        (failure) => null,
        (conversations) {
          if (conversations.isEmpty) return null;
          final match = conversations.firstWhere(
            (c) => c.withUserId != event.currentUserId,
            orElse: () => conversations.first,
          );
          return match;
        },
      );
      if (resolved == null) {
        emit(
          const ChatState.failure(
            message: 'No se encontró una conversación para este pedido',
          ),
        );
        return;
      }
      withUserId = resolved.withUserId;
      interlocutorName ??= resolved.withUserName;
    }

    final accessResult = await getChatAccessUseCase(
      GetChatAccessParams(
        serviceRequestId: event.serviceRequestId,
        withUserId: withUserId,
      ),
    );

    final access = accessResult.fold(
      (failure) {
        emit(ChatState.failure(message: mapChatErrorMessage(failure)));
        return null;
      },
      (value) => value,
    );
    if (access == null) return;

    final messagesResult = await getChatMessagesUseCase(
      GetChatMessagesParams(
        serviceRequestId: event.serviceRequestId,
        withUserId: withUserId,
      ),
    );

    final paged = messagesResult.fold(
      (failure) {
        emit(ChatState.failure(message: mapChatErrorMessage(failure)));
        return null;
      },
      (value) => value,
    );
    if (paged == null) return;

    await markChatAsReadUseCase(
      MarkChatAsReadParams(
        serviceRequestId: event.serviceRequestId,
        withUserId: withUserId,
      ),
    );

    await _connectSignalR(
      serviceRequestId: event.serviceRequestId,
      withUserId: withUserId,
    );

    emit(
      ChatState.loaded(
        serviceRequestId: event.serviceRequestId,
        withUserId: withUserId,
        currentUserId: event.currentUserId,
        messages: _sortMessages(paged.items),
        access: access,
        hasMore: paged.hasMore,
        nextCursor: paged.nextCursor,
        interlocutorName: interlocutorName,
      ),
    );
  }

  Future<void> _connectSignalR({
    required String serviceRequestId,
    required String withUserId,
  }) async {
    await _messageSubscription?.cancel();
    await _messagesReadSubscription?.cancel();

    final token = await tokenStorage.read(TokenStorage.accessTokenKey);
    if (token == null || token.isEmpty) return;

    await signalRService.connect(token);
    await signalRService.joinThread(
      serviceRequestId: serviceRequestId,
      withUserId: withUserId,
    );

    _messageSubscription = signalRService.onMessageReceived.listen((message) {
      add(ChatEvent.messageReceived(message: message));
    });

    _messagesReadSubscription = signalRService.onMessagesRead.listen((event) {
      add(
        ChatEvent.messagesRead(
          readByUserId: event.readByUserId,
          withUserId: event.withUserId,
        ),
      );
    });
  }

  Future<void> _onSendMessage(
    ChatSendMessage event,
    Emitter<ChatState> emit,
  ) async {
    final loaded = state.mapOrNull(loaded: (s) => s);
    if (loaded == null || loaded.isSending || !loaded.access.canSend) return;

    emit(loaded.copyWith(isSending: true, sendError: null));

    final result = await sendChatMessageUseCase(
      SendChatMessageParams(
        serviceRequestId: loaded.serviceRequestId,
        toUserId: loaded.withUserId,
        content: event.content.trim(),
      ),
    );

    result.fold(
      (failure) {
        final current = state.mapOrNull(loaded: (s) => s);
        if (current != null) {
          emit(
            current.copyWith(
              isSending: false,
              sendError: mapChatErrorMessage(failure),
            ),
          );
        }
      },
      (message) {
        final current = state.mapOrNull(loaded: (s) => s);
        if (current == null) return;
        emit(
          current.copyWith(
            isSending: false,
            messages: _sortMessages(_appendMessage(current.messages, message)),
          ),
        );
      },
    );
  }

  Future<void> _onLoadOlderMessages(
    ChatLoadOlderMessages event,
    Emitter<ChatState> emit,
  ) async {
    final loaded = state.mapOrNull(loaded: (s) => s);
    if (loaded == null ||
        loaded.isLoadingOlder ||
        !loaded.hasMore ||
        loaded.nextCursor == null) {
      return;
    }

    emit(loaded.copyWith(isLoadingOlder: true));

    final result = await getChatMessagesUseCase(
      GetChatMessagesParams(
        serviceRequestId: loaded.serviceRequestId,
        withUserId: loaded.withUserId,
        cursor: loaded.nextCursor,
      ),
    );

    result.fold(
      (failure) {
        final current = state.mapOrNull(loaded: (s) => s);
        if (current != null) {
          emit(current.copyWith(isLoadingOlder: false));
        }
      },
      (paged) {
        final current = state.mapOrNull(loaded: (s) => s);
        if (current == null) return;

        final merged = _sortMessages([
          ...paged.items,
          ...current.messages,
        ]);

        emit(
          current.copyWith(
            isLoadingOlder: false,
            messages: merged,
            hasMore: paged.hasMore,
            nextCursor: paged.nextCursor,
          ),
        );
      },
    );
  }

  void _onMessageReceived(
    ChatMessageReceived event,
    Emitter<ChatState> emit,
  ) {
    final loaded = state.mapOrNull(loaded: (s) => s);
    if (loaded == null) return;

    final message = event.message;
    if (message.serviceRequestId != loaded.serviceRequestId) return;

    final isSameThread = message.fromUserId == loaded.withUserId ||
        message.toUserId == loaded.withUserId;
    if (!isSameThread) return;

    emit(
      loaded.copyWith(
        messages: _sortMessages(
          _appendMessage(loaded.messages, message),
        ),
      ),
    );
  }

  void _onMessagesRead(ChatMessagesRead event, Emitter<ChatState> emit) {
    final loaded = state.mapOrNull(loaded: (s) => s);
    if (loaded == null) return;
    if (event.withUserId != loaded.withUserId) return;

    final updated = loaded.messages
        .map(
          (message) => message.fromUserId == loaded.currentUserId &&
                  message.toUserId == loaded.withUserId &&
                  event.readByUserId == loaded.withUserId
              ? ChatMessage(
                  id: message.id,
                  fromUserId: message.fromUserId,
                  toUserId: message.toUserId,
                  serviceRequestId: message.serviceRequestId,
                  content: message.content,
                  createdAt: message.createdAt,
                  isRead: true,
                )
              : message,
        )
        .toList();

    emit(loaded.copyWith(messages: updated));
  }

  Future<void> _onClosed(ChatClosed event, Emitter<ChatState> emit) async {
    await _messageSubscription?.cancel();
    await _messagesReadSubscription?.cancel();
    _messageSubscription = null;
    _messagesReadSubscription = null;
    await signalRService.disconnect();
  }

  List<ChatMessage> _appendMessage(
    List<ChatMessage> messages,
    ChatMessage message,
  ) {
    if (messages.any((m) => m.id == message.id)) return messages;
    return [...messages, message];
  }

  List<ChatMessage> _sortMessages(List<ChatMessage> messages) {
    final sorted = [...messages]
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return sorted;
  }

  @override
  Future<void> close() async {
    await _messageSubscription?.cancel();
    await _messagesReadSubscription?.cancel();
    await signalRService.disconnect();
    return super.close();
  }
}
