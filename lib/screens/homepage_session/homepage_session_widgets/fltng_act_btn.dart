import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/screens/home_page/home_page.dart';

class button extends StatelessWidget {
  const button({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          top: 745,
          right: 170,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 300,
                    width: screenWidth,
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              text: 'End Session',
                              color: Color(0xFF21295C),
                              size: 23,
                              weight: FontWeight.bold),
                          customText(
                              text: 'Are you sure to end the Session?',
                              color: Color(0xFF21295C),
                              size: 15,
                              weight: FontWeight.w400),
                          SizedBox(
                            height: 55,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: customText(
                                  text: 'Cancel',
                                  color: Color(0xFF1F7494),
                                  size: 20,
                                  weight: FontWeight.bold),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(250, 50),
                                side: BorderSide(
                                    color: Color(0xFF1F7494), width: 2.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: EdgeInsets.all(25),
                                      height: 300,
                                      width: screenWidth,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            child: Image.asset(
                                                'assets/CheckIcon.png'),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          customText(
                                              text: 'Session Saved',
                                              color: Color(0xFF21295C),
                                              size: 25,
                                              weight: FontWeight.bold),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                    index: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: customText(
                                                text: 'Confirm',
                                                color: Colors.white,
                                                size: 20,
                                                weight: FontWeight.bold),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF065A82),
                                              minimumSize: Size(250, 50),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: customText(
                                  text: 'Confirm',
                                  color: Colors.white,
                                  size: 20,
                                  weight: FontWeight.bold),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFCD2B00),
                                minimumSize: Size(250, 50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFCD2B00),
            child: Icon(
              Icons.close,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
