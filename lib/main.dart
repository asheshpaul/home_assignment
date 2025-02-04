import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_assignment/presentation/cubits/home_page_cubit.dart';
import 'package:home_assignment/presentation/views/home_page.dart';

import 'presentation/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => HomePageCubit(),
        child: const HomePage(),
      ),
    );
  }
}
