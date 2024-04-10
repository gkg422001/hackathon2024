import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';

class no_patients_UI extends StatelessWidget {
  const no_patients_UI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customText(
          text: 'No Patient',
          color: Color.fromARGB(255, 192, 184, 184),
          size: 45,
          weight: FontWeight.bold,
        ),
        customText(
          text: 'Yet',
          color: Color.fromARGB(255, 192, 184, 184),
          size: 45,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}
