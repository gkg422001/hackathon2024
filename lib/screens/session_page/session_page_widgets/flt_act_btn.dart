import 'package:flutter/material.dart';
import 'package:hackathon/screens/homepage_session/home_page_session.dart';
// import 'package:hackathon/screens/start_event_page/start_event_page.dart';

class fltActBtn extends StatelessWidget {
  const fltActBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 745,
          right: 170,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => HomePageSession(),
                ),
              );
            },
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF009340),
            child: Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
