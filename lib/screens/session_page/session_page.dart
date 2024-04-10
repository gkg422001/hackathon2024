import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/nav_bar_widgets/query_nav.dart';
import 'package:hackathon/nav_bar_widgets/home_nav.dart';
import 'package:hackathon/nav_bar_widgets/profile_nav.dart';
import 'package:hackathon/screens/home_page/home_page.dart';
import 'package:hackathon/screens/query_page/query_page.dart';
import 'package:hackathon/screens/session_page/session_page_widgets/back_button.dart';
import 'package:hackathon/screens/session_page/session_page_widgets/flt_act_btn.dart';
import 'package:hackathon/screens/session_page/session_page_widgets/srch_txt_fld.dart';
import 'package:hackathon/screens/session_page/session_page_widgets/user_grt_cont.dart';

class SessionPage extends StatefulWidget {
  SessionPage({super.key, required this.name});
  final String name;
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
            backButn(
              index: _currentIndex,
            ),
            SizedBox(
              height: 25,
            ),
            userGrtCont(
              screenWidth: screenWidth,
              name: widget.name,
            ),
            SizedBox(
              height: 30,
            ),
            SrchTxtField(controller: cntr),
            SizedBox(
              height: 10,
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
