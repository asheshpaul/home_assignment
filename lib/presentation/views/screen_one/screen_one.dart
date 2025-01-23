import 'package:flutter/material.dart';
import 'package:home_assignment/presentation/views/widgets/page_view_screen.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return PageViewScreen(
      index: '1',
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.deepPurple.shade200,
            child: Icon(
              Icons.face,
              size: 56,
            ),
          ),
        ),
        SectionDivider(),
        ListTile(
          title: Text(
            "Hello User,\n"
            "I'm your health assistant.\n"
            "How can I help you today?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBar(
            enabled: false,
            elevation: WidgetStateProperty.all(2.0),
            hintText: 'Search for health tips',
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.search),
            ),
          ),
        ),
        SectionDivider(),
        ListTile(
          dense: true,
          title: Text(
            "Health Tips:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        HealthTipsTile(
          title: 'Stay Hydrated',
          subtitle:
              'Drink at least 8 glasses of water a day to keep your body hydrated.',
        ),
        HealthTipsTile(
          title: 'Eat Balanced Meals',
          subtitle:
              'Include a variety of fruits, vegetables, and proteins in your diet.',
        ),
        HealthTipsTile(
          title: 'Exercise Regularly',
          subtitle:
              'Aim for at least 30 minutes of physical activity most days of the week.',
        ),
      ],
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
      subtitle: Text(subtitle, style: TextStyle(color: Colors.white54)),
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
      child: SizedBox(
          width: 80,
          child: Divider(
            thickness: 3,
            color: Colors.white38,
          )),
    );
  }
}
