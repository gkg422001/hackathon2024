import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/screens/home_page/home_page.dart';

class submitButton extends StatelessWidget {
  const submitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: customText(
            text: 'Submit',
            color: Colors.white,
            size: 20,
            weight: FontWeight.bold),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 30, 198, 36),
          minimumSize: Size(250, 50),
        ),
      ),
    );
  }
}
