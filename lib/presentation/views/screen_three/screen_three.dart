import 'package:flutter/material.dart';
import 'package:home_assignment/presentation/views/widgets/page_view_screen.dart';
import 'package:home_assignment/presentation/views/widgets/section_divider.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return PageViewScreen(
      index: '3',
      children: [
        Image.asset('assets/doctor.png'),
        ListTile(
          title: Text(
            "Say Hello to your Healthcare partner",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "I'm here to help you with your health queries. "
                "You can ask me anything related to your health and I will try to help you.",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
        ),
        SectionDivider(),
        ListTile(
          title: Text(
            "Categories:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              side: WidgetStateProperty.all(
                BorderSide(color: Colors.white70),
              ),
            ),
            child: Text('View All', style: TextStyle(color: Colors.white70)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoriesCard(
                icon: Icons.remove_red_eye_outlined, title: 'Vision'),
            CategoriesCard(icon: Icons.monitor_heart_outlined, title: 'Heart'),
            CategoriesCard(icon: Icons.hearing_outlined, title: 'Hearing'),
          ],
        ),
      ],
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoriesCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(
              icon,
              size: 84,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}