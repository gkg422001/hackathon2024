import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';

class userGrtCont extends StatelessWidget {
  const userGrtCont({super.key, required this.screenWidth});
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 5, 15, 5),
      height: 80,
      width: screenWidth - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color(0xFF1B3B6F),
      ),
      child: Row(
        children: [
          customText(
            text: 'Patient A',
            size: 20,
            color: Colors.white,
            weight: FontWeight.w400,
          ),
          SizedBox(
            width: 8,
          ),
          Spacer(),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
