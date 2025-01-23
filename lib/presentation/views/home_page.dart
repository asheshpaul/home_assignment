import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/domain/repositories/chat_repository.dart';
import 'package:home_assignment/presentation/cubits/chat_cubit.dart';
import 'package:home_assignment/presentation/cubits/home_page_cubit.dart';
import 'package:home_assignment/presentation/views/chat_interface/chat_interface_screen.dart';
import 'package:home_assignment/presentation/views/widgets/page_indicator.dart';
import 'package:home_assignment/presentation/views/widgets/page_view_screen.dart';

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
                    PageViewScreen(index: '1'),
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

class HealthTipsTile extends StatelessWidget {
  final String title, subtitle;

  const HealthTipsTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child:
          SizedBox(width: 80, child: Divider(thickness: 3, color: Colors.grey)),
    );
  }
}
