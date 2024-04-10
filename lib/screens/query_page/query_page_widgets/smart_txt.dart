import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';

class smart_query_txt extends StatelessWidget {
  const smart_query_txt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        customText(
            text: 'Smart Query',
            color: Color.fromARGB(255, 7, 59, 101),
            size: 40,
            weight: FontWeight.bold),
        Spacer(),
        Container(
            width: 35,
            height: 35,
            // decoration: BoxDecoration(color: Colors.white),
            child: Image.asset('assets/BlueClock.png')),
      ],
    );
  }
}
