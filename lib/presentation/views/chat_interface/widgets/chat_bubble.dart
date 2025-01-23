import 'package:flutter/material.dart';

enum SenderType { sender, receiver }

class ChatBubble extends StatelessWidget {
  final SenderType senderType;
  final String message, messageTime;

  const ChatBubble({
    super.key,
    required this.senderType,
    required this.message,
    required this.messageTime,
  });

  @override
  Widget build(BuildContext context) {
    final isSender = senderType == SenderType.sender;
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding:
                const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isSender ? Colors.blueAccent : Colors.grey[300],
              borderRadius: BorderRadius.only(
                bottomLeft: isSender ? const Radius.circular(8.0) : Radius.zero,
                bottomRight:
                    isSender ? Radius.zero : const Radius.circular(8.0),
                topLeft: isSender ? const Radius.circular(8.0) : Radius.zero,
                topRight: isSender ? Radius.zero : const Radius.circular(8.0),
              ),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.85,
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black87,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(messageTime,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                )),
          ),
        ],
      ),
    );
  }
}
