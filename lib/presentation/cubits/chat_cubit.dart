import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/domain/repositories/chat_repository.dart';
import 'package:home_assignment/presentation/cubits/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;

  ChatCubit(this.chatRepository) : super(ChatState(messages: []));

  void sendMessage(String userMessage) {
    final newMessages = chatRepository.getSystemResponse(userMessage);
    emit(state.copyWith(messages: [...state.messages, ...newMessages]));
  }
}
