import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';

class Events extends StatelessWidget {
  const Events({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(1, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Color(0xFF1B3B6F),
                BlendMode.srcIn,
              ),
              child: Image.asset('assets/IconMic.png'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          customText(
              text: 'audio_example_20231128.aac',
              color: Color(0xFF1B3B6F),
              size: 17,
              weight: FontWeight.bold),
        ],
      ),
    );
  }
}
