import 'package:flutter/material.dart';
import 'package:home_assignment/presentation/views/widgets/page_view_screen.dart';

class ChatInterfaceScreen extends StatelessWidget {
  const ChatInterfaceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageViewScreen(
      index: '2',
      children: [
        Expanded(
          child: ListView(
            children: [
              Center(child: Text('Message List')),
            ],
          ),
        ),
      ],
    );
  }
}
