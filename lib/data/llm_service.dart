import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LLMService {
  final String _baseUrl = 'https://api.cohere.com/v2/chat';
  final String _apiKey = 'W70SHkSoImvaLJs2VDKYVsgFQ324xyebeW9gAkZI';

  Future<String> sendMessage(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "command-r-plus",
          "messages": [
            {
              "role": "user",
              "content": userMessage,
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['message'] != null &&
            responseData['message']['content'] != null) {
          final contentList = responseData['message']['content'];
          if (contentList.isNotEmpty && contentList[0]['type'] == 'text') {
            return contentList[0]['text'];
          } else {
            throw Exception(
                'Content list is empty or does not contain text type');
          }
        } else {
          throw Exception(
              'Message or content field is null. Full response: ${response.body}');
        }
      } else {
        final errorData = jsonDecode(response.body);
        if (kDebugMode) {
          print('${errorData['message']}');
        }
        throw Exception(
            'Failed to get response from LLM: ${errorData['message']}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Map<String, Object> fullResponse = {
    "id": "00f9a9b7-25a9-4294-acba-5935c9e79912",
    "message": {
      "role": "assistant",
      "content": [
        {"type": "text", "text": "Hello! How can I help you today?"}
      ]
    },
    "finish_reason": "COMPLETE",
    "usage": {
      "billed_units": {"input_tokens": 1, "output_tokens": 9},
      "tokens": {"input_tokens": 194, "output_tokens": 9}
    }
  };
}
