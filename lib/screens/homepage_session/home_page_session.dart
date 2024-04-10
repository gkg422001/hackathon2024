import 'package:flutter/material.dart';
import 'package:hackathon/nav_bar_widgets/query_nav.dart';
// import 'package:hackathon/nav_bar_widgets/home_nav.dart';
// import 'package:hackathon/nav_bar_widgets/profile_nav.dart';
import 'package:hackathon/screens/home_page/home_page.dart';
import 'package:hackathon/screens/homepage_session/homepage_session_widgets/example_event_cont.dart';
import 'package:hackathon/screens/homepage_session/homepage_session_widgets/fltng_act_btn.dart';
import 'package:hackathon/screens/homepage_session/homepage_session_widgets/info_txt_fld.dart';
import 'package:hackathon/screens/homepage_session/homepage_session_widgets/toggle_btn.dart';
import 'package:hackathon/screens/homepage_session/homepage_session_widgets/upload_btns.dart';
import 'package:hackathon/screens/query_page/query_page.dart';

class HomePageSession extends StatefulWidget {
  HomePageSession({super.key});
  @override
  _HomeWithEventState createState() => _HomeWithEventState();
}

class _HomeWithEventState extends State<HomePageSession> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFECF0F3),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            exampleEvent(),
            SizedBox(
              height: 20,
            ),
            toggleBtn(),
            SizedBox(
              height: 35,
            ),
            infoTxtField(),
            SizedBox(
              height: 35,
            ),
            UploadButtons(),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: button(
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true, // Only show label for the selected item
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Home.png',
              width: 20,
              height: 20,
            ),
            // home_nav(),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: query_nav(
              index: _currentIndex,
            ),
            label: 'Query',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Clock.png',
              width: 20,
              height: 20,
            ),
            label: 'Clock',
          ),
          // BottomNavigationBarItem(
          //   icon: profile_nav(),
          //   label: 'Profile',
          // ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (_currentIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QueryPage(
                  index: index,
                ),
              ),
            );
          } else if (_currentIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(index: _currentIndex),
              ),
            );
          }
        },
      ),
    );
  }
}
