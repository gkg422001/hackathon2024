import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';

class sessionCont extends StatelessWidget {
  const sessionCont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      width: 350,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              customText(
                  text: 'Tags:',
                  color: Color(0xFF1B3B6F),
                  size: 16,
                  weight: FontWeight.w400),
              Spacer(),
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFF1F7494),
                    borderRadius: BorderRadius.circular(7)),
                child: Center(
                  child: customText(
                      text: 'Add Tags',
                      color: Colors.white,
                      size: 13,
                      weight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFFFFCC48),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: customText(
                      text: 'Sport',
                      color: Colors.white,
                      size: 13,
                      weight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFFFF6E48),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: customText(
                      text: 'Political',
                      color: Colors.white,
                      size: 13,
                      weight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
