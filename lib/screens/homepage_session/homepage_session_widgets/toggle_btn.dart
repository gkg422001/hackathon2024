import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/screens/homepage_session/home_page_session.dart';
import 'package:hackathon/screens/notes_page/notes_page.dart';

class toggleBtn extends StatelessWidget {
  const toggleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePageSession(),
                ),
              );
            },
            child: Container(
              width: 190,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xFF1F7494),
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: customText(
                    text: 'Upload',
                    color: Colors.white,
                    size: 15,
                    weight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesPage(),
                ),
              );
            },
            child: Container(
              width: 170,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: customText(
                    text: 'Notes',
                    color: Color(0xFFBDC0C2),
                    size: 15,
                    weight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
