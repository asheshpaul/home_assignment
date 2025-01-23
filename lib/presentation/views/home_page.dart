import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/domain/repositories/chat_repository.dart';
import 'package:home_assignment/presentation/cubits/chat_cubit.dart';
import 'package:home_assignment/presentation/cubits/home_page_cubit.dart';
import 'package:home_assignment/presentation/views/chat_interface/chat_interface_screen.dart';
import 'package:home_assignment/presentation/views/widgets/page_indicator.dart';
import 'package:home_assignment/presentation/views/widgets/page_view_screen.dart';

import 'screen_one/screen_one.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(ChatRepository()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: Column(
            children: [
              PageIndicator(),
              Expanded(
                child: PageView(
                  controller: PageController(initialPage: 1),
                  onPageChanged: (index) {
                    context.read<HomePageCubit>().setPage(index);
                  },
                  children: [
                    ScreenOne(),
                    ChatInterfaceScreen(),
                    PageViewScreen(index: '3'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
