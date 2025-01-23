import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  final String index;
  final List<Widget>? children;

  const PageViewScreen({
    super.key,
    required this.index,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'Screen $index',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ...?children,
      ],
    );
  }
}
