import 'package:flutter/material.dart';

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