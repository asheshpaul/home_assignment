import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/presentation/cubits/chat_cubit.dart';

class MessageInputBar extends StatelessWidget {
  MessageInputBar({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0).copyWith(bottom: 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black45),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: 'Ask anything',
                  border: InputBorder.none,
                  filled: true),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              final message = controller.text;
              if (message.isNotEmpty) {
                context.read<ChatCubit>().sendMessage(message);
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
