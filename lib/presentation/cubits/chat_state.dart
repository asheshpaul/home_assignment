import 'package:home_assignment/domain/entities/message.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {
  final List<Message> messages;

  ChatSuccess(this.messages);
}
