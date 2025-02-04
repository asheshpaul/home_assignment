import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/presentation/cubits/chat_cubit.dart';
import 'package:home_assignment/presentation/cubits/chat_state.dart';
import 'package:home_assignment/presentation/views/widgets/page_view_screen.dart';
import 'package:intl/intl.dart';

import 'widgets/chat_bubble.dart';
import 'widgets/message_input_bar.dart';

class ChatInterfaceScreen extends StatelessWidget {
  const ChatInterfaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String messageTime = DateFormat('hh:mm a').format(DateTime.now());
    return PageViewScreen(
      index: '2',
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    return ListView(
                      reverse: true,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        if (state is ChatSuccess)
                          ...state.messages.reversed.map((message) {
                            return ChatBubble(
                              message: message.content,
                              messageTime: message.time,
                              senderType: message.isUser
                                  ? SenderType.sender
                                  : SenderType.receiver,
                            );
                          }),
                        ChatBubble(
                          message: 'Hello, how can I help you?',
                          messageTime: '',
                          senderType: SenderType.receiver,
                        ),
                        ChatBubble(
                          message: 'I walked 2000 steps today',
                          messageTime: '12:04 PM',
                          senderType: SenderType.sender,
                        ),
                        ChatBubble(
                          message:
                              'I had idly, vada and filter coffee for breakfast, '
                              'I had idly, vada and filter coffee for breakfast',
                          messageTime: '5 Mins',
                          senderType: SenderType.sender,
                        ),
                        ChatBubble(
                          message: 'From your weekly food pattern,\n\n'
                              'Consider reducing sugar rich foods like Kesari bath',
                          messageTime: '',
                          senderType: SenderType.receiver,
                        ),
                      ],
                    );
                  },
                ),
              ),
              MessageInputBar(),
            ],
          ),
        ),
      ],
    );
  }
}
