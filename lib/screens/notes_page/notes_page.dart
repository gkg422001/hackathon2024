import 'package:flutter/material.dart';
import 'package:hackathon/nav_bar_widgets/event_nav.dart';
import 'package:hackathon/nav_bar_widgets/home_nav.dart';
import 'package:hackathon/nav_bar_widgets/profile_nav.dart';
import 'package:hackathon/screens/homepage_session/homepage_session_widgets/example_event_cont.dart';
import 'package:hackathon/screens/homepage_session/homepage_session_widgets/fltng_act_btn.dart';
import 'package:hackathon/screens/notes_page/notes_page_widgets/event_cont.dart';
import 'package:hackathon/screens/notes_page/notes_page_widgets/tgl_btn.dart';

class NotesPage extends StatefulWidget {
  NotesPage({super.key});
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF0F3),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            exampleEvent(),
            SizedBox(
              height: 20,
            ),
            toggleBtn2(),
            SizedBox(
              height: 35,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Events(),
                    SizedBox(
                      height: 15,
                    ),
                    Events(),
                    SizedBox(
                      height: 15,
                    ),
                    Events(),
                    SizedBox(
                      height: 15,
                    ),
                    Events(),
                    SizedBox(
                      height: 15,
                    ),
                    Events(),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: button(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: home_nav(),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: event_nav(),
            label: 'Event List',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Clock.png',
              width: 20,
              height: 20,
            ),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: profile_nav(),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
