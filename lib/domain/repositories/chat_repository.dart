import 'package:home_assignment/data/dummy_data.dart';
import 'package:home_assignment/domain/entities/message.dart';
import 'package:intl/intl.dart';

class ChatRepository {
  List<Message> getSystemResponse(String userMessage) {
    final systemResponse = systemResponses[DateTime.now().second % 3];
    return [
      Message(
        content: userMessage,
        isUser: true,
        time: DateFormat('hh:mm a').format(DateTime.now()),
      ),
      Message(content: systemResponse, isUser: false, time: ''),
    ];
  }
}
