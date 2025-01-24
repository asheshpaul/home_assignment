import 'package:home_assignment/data/llm_service.dart';

class ChatRepository {
  final LLMService llmService;

  ChatRepository({required this.llmService});

  Future<String> fetchLLMResponse(String userMessage) {
    return llmService.sendMessage(userMessage);
  }
}
