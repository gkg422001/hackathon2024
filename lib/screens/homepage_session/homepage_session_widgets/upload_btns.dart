import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';

class UploadButtons extends StatelessWidget {
  const UploadButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 110,
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(50)),
      child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: 280,
                height: 70,
                decoration: BoxDecoration(
                    color: Color(0xff1F7494),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(color: Color(0xff1F7494)),
                      child: Image.asset('assets/IconMic.png'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    customText(
                        text: 'Upload Audio Recording',
                        color: Colors.white,
                        size: 15,
                        weight: FontWeight.normal),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
