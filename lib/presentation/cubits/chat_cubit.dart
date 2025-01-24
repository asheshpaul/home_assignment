import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/domain/entities/message.dart';
import 'package:home_assignment/domain/repositories/chat_repository.dart';
import 'package:home_assignment/presentation/cubits/chat_state.dart';
import 'package:intl/intl.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;

  ChatCubit(this.chatRepository) : super(ChatInitial());

  final List<Message> _messages = [];

  void sendMessage(String userMessage) async {
    final messageTime = DateFormat('hh:mm a').format(DateTime.now());

    /// Add user message to the list
    final userMessageObj = Message(
      content: userMessage,
      time: messageTime,
      isUser: true,
    );
    _messages.add(userMessageObj);
    emit(ChatSuccess(List.from(_messages)));

    /// Add loading message for the receiver
    final loadingMessage = Message(
      content: 'Typing...',
      time: '',
      isUser: false,
    );
    _messages.add(loadingMessage);
    emit(ChatSuccess(List.from(_messages)));

    try {
      /// Get LLM response
      final llmResponse = await chatRepository.fetchLLMResponse(userMessage);
      _messages.removeLast();
      final botMessage = Message(
        content: llmResponse,
        time: '',
        isUser: false,
      );
      _messages.add(botMessage);
      emit(ChatSuccess(List.from(_messages)));
    } catch (e) {
      _messages.removeLast();
      final errorMessage = Message(
        content: e.toString(),
        time: '',
        isUser: false,
      );
      _messages.add(errorMessage);
      emit(ChatSuccess(List.from(_messages)));
    }
  }
}
