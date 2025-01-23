import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/presentation/cubits/chat_cubit.dart';
import 'package:home_assignment/presentation/theme/app_colors.dart';

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
              color: Colors.white70,
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFF353535)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.messageInputBg,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: 'Ask anything',
                      border: InputBorder.none,
                      filled: true,
                    fillColor: AppColors.messageInputBg
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: Colors.white70,
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
