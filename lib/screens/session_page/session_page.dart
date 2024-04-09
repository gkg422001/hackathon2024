import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/nav_bar_widgets/event_nav.dart';
import 'package:hackathon/nav_bar_widgets/home_nav.dart';
import 'package:hackathon/nav_bar_widgets/profile_nav.dart';
import 'package:hackathon/screens/session_page/session_page_widgets/back_button.dart';
import 'package:hackathon/screens/session_page/session_page_widgets/flt_act_btn.dart';
import 'package:hackathon/screens/session_page/session_page_widgets/srch_txt_fld.dart';
import 'package:hackathon/screens/session_page/session_page_widgets/user_grt_cont.dart';

class SessionPage extends StatefulWidget {
  SessionPage({super.key});
  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<SessionPage> {
  int _currentIndex = 0;
  final TextEditingController cntr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFECF0F3),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backButn(),
            SizedBox(
              height: 25,
            ),
            userGrtCont(
              screenWidth: screenWidth,
            ),
            SizedBox(
              height: 30,
            ),
            SrchTxtField(controller: cntr),
            SizedBox(
              height: 160,
            ),
            //ADD conditional statement. If there are no existing data in the database display 'NO PATIENT YET" else Display all patients.
            Center(
              child: customText(
                  text: 'No Session',
                  color: Color.fromARGB(255, 192, 184, 184),
                  size: 45,
                  weight: FontWeight.bold),
            ),
            Center(
              child: customText(
                  text: 'Yet',
                  color: Color.fromARGB(255, 192, 184, 184),
                  size: 45,
                  weight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: fltActBtn(),
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