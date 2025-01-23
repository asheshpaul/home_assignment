
import 'package:home_assignment/domain/entities/message.dart';

class ChatState {
  final List<Message> messages;

  ChatState({required this.messages});

  ChatState copyWith({List<Message>? messages}) {
    return ChatState(
      messages: messages ?? this.messages,
    );
  }
}