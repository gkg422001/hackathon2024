import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/screens/home_page/home_page.dart';

class back extends StatelessWidget {
  const back({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => HomePage(),
          ),
        );
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(25)),
        child: Row(children: [
          Image.asset(
            'assets/backBtn.png',
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 5,
          ),
          customText(
            text: 'Back',
            color: Colors.black,
            size: 20,
            weight: FontWeight.bold,
          ),
        ]),
      ),
    );
  }
}
