import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';

class exampleEvent extends StatelessWidget {
  const exampleEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 80,
      decoration: BoxDecoration(
          color: Color(0xFF1B3B6F), borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Row(
          children: [
            customText(
                text: 'Session 1',
                color: Colors.white,
                size: 20,
                weight: FontWeight.bold),
            Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
