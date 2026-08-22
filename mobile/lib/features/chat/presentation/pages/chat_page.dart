import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';
import 'package:mobile/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:mobile/features/chat/presentation/bloc/chat_event.dart';
import 'package:mobile/features/chat/presentation/bloc/chat_state.dart';
import 'package:mobile/features/chat/presentation/widgets/chat_empty_state.dart';
import 'package:mobile/features/chat/presentation/widgets/chat_input_bar.dart';
import 'package:mobile/features/chat/presentation/widgets/chat_message_bubble.dart';
import 'package:mobile/features/chat/presentation/widgets/chat_read_only_banner.dart';

class ChatPage extends StatelessWidget {
  final String serviceRequestId;
  final String? withUserId;
  final String? interlocutorName;

  const ChatPage({
    super.key,
    required this.serviceRequestId,
    this.withUserId,
    this.interlocutorName,
  });

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final currentUserId = authState.maybeWhen(
      authenticated: (session) => session.user.id,
      orElse: () => null,
    );

    if (currentUserId == null) {
      return const Scaffold(
        body: Center(child: Text('Sesión no válida')),
      );
    }

    return BlocProvider(
      create: (_) => sl<ChatBloc>()
        ..add(
          ChatEvent.opened(
            serviceRequestId: serviceRequestId,
            currentUserId: currentUserId,
            withUserId: withUserId,
            interlocutorName: interlocutorName,
          ),
        ),
      child: _ChatView(
        serviceRequestId: serviceRequestId,
        withUserId: withUserId,
        interlocutorName: interlocutorName,
        currentUserId: currentUserId,
      ),
    );
  }
}

class _ChatView extends StatefulWidget {
  final String serviceRequestId;
  final String? withUserId;
  final String? interlocutorName;
  final String currentUserId;

  const _ChatView({
    required this.serviceRequestId,
    this.withUserId,
    this.interlocutorName,
    required this.currentUserId,
  });

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final _scrollController = ScrollController();
  final _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    context.read<ChatBloc>().add(const ChatEvent.closed());
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _inputController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.pixels <= 48) {
      context.read<ChatBloc>().add(const ChatEvent.loadOlderMessages());
    }
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  void _sendMessage() {
    final content = _inputController.text.trim();
    if (content.isEmpty) return;
    _inputController.clear();
    context.read<ChatBloc>().add(ChatEvent.sendMessage(content: content));
  }

  void _retryOpen() {
    context.read<ChatBloc>().add(
          ChatEvent.opened(
            serviceRequestId: widget.serviceRequestId,
            currentUserId: widget.currentUserId,
            withUserId: widget.withUserId,
            interlocutorName: widget.interlocutorName,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listenWhen: (previous, current) {
        if (current is ChatLoaded && current.sendError != null) {
          return previous is! ChatLoaded ||
              previous.sendError != current.sendError;
        }
        if (current is ChatLoaded) {
          if (previous is! ChatLoaded) return true;
          return current.messages.length > previous.messages.length;
        }
        return false;
      },
      listener: (context, state) {
        if (state is ChatLoaded) {
          if (state.sendError != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.sendError!)));
          } else {
            _scrollToBottom();
          }
        }
      },
      builder: (context, state) {
        return PopScope(
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) {
              context.read<ChatBloc>().add(const ChatEvent.closed());
            }
          },
          child: Scaffold(
            backgroundColor: context.colors.surfaceContainerLow,
            appBar: AppBar(
              backgroundColor: context.colors.surface,
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
              title: Text(
                state.maybeWhen(
                  loaded: (_, __, ___, ____, _____, ______, _______, interlocutorName,
                      ________, _________, __________) {
                    return interlocutorName ??
                        widget.interlocutorName ??
                        'Chat';
                  },
                  orElse: () => widget.interlocutorName ?? 'Chat',
                ),
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
            ),
            body: state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (message) => _FailureBody(
                message: message,
                onRetry: _retryOpen,
              ),
              loaded: (
                serviceRequestId,
                withUserId,
                currentUserId,
                messages,
                access,
                hasMore,
                nextCursor,
                interlocutorName,
                isLoadingOlder,
                isSending,
                sendError,
              ) {
                return Column(
                  children: [
                    if (access.isReadOnly)
                      ChatReadOnlyBanner(blockedReason: access.blockedReason),
                    Expanded(
                      child: messages.isEmpty &&
                              access.waitingForClientMessage
                          ? const ChatEmptyState(
                              message:
                                  'Debés recibir un mensaje del cliente antes de poder responder.',
                            )
                          : _MessagesList(
                              scrollController: _scrollController,
                              messages: messages,
                              currentUserId: currentUserId,
                              isLoadingOlder: isLoadingOlder,
                            ),
                    ),
                    ChatInputBar(
                      controller: _inputController,
                      enabled: access.canSend && !isSending,
                      isSending: isSending,
                      onSend: _sendMessage,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _MessagesList extends StatelessWidget {
  final ScrollController scrollController;
  final List<ChatMessage> messages;
  final String currentUserId;
  final bool isLoadingOlder;

  const _MessagesList({
    required this.scrollController,
    required this.messages,
    required this.currentUserId,
    required this.isLoadingOlder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      itemCount: messages.length + (isLoadingOlder ? 1 : 0),
      itemBuilder: (context, index) {
        if (isLoadingOlder && index == 0) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }

        final messageIndex = isLoadingOlder ? index - 1 : index;
        final message = messages[messageIndex];
        final isMine = message.fromUserId == currentUserId;
        final showDateHeader = messageIndex == 0 ||
            !_isSameDay(
              messages[messageIndex - 1].createdAt,
              message.createdAt,
            );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showDateHeader)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  formatShortDate(message.createdAt),
                  textAlign: TextAlign.center,
                  style: context.text.labelSmall?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ),
            ChatMessageBubble(
              message: message,
              isMine: isMine,
            ),
          ],
        );
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _FailureBody extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _FailureBody({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: context.appColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.text.bodyLarge?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }
}
