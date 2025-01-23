import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/domain/repositories/chat_repository.dart';
import 'package:home_assignment/presentation/cubits/chat_cubit.dart';
import 'package:home_assignment/presentation/cubits/home_page_cubit.dart';
import 'package:home_assignment/presentation/theme/app_colors.dart';
import 'package:home_assignment/presentation/views/chat_interface/chat_interface_screen.dart';
import 'package:home_assignment/presentation/views/widgets/page_indicator.dart';

import 'screen_one/screen_one.dart';
import 'screen_three/screen_three.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(ChatRepository()),
      child: Scaffold(
        body: Container(
          color: AppColors.primary,
          child: Padding(
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
                      ScreenThree(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
