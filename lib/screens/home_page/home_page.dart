import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/nav_bar_widgets/event_nav.dart';
import 'package:hackathon/nav_bar_widgets/home_nav.dart';
import 'package:hackathon/nav_bar_widgets/profile_nav.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/search_txt_field.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/floating_act_btn.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/user_greeting_cont.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
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
          children: [
            userGreetingCont(
              screenWidth: screenWidth,
              username: 'User',
            ),
            SizedBox(
              height: 30,
            ),
            SearchTxtField(controller: cntr),
            SizedBox(
              height: 150,
            ),
            //ADD conditional statement. If there are no existing data in the database display 'NO SESSION STARTED YET" else Display all sessions.
            customText(
                text: 'No Session',
                color: Color.fromARGB(255, 192, 184, 184),
                size: 45,
                weight: FontWeight.bold),
            customText(
                text: 'Started Yet',
                color: Color.fromARGB(255, 192, 184, 184),
                size: 45,
                weight: FontWeight.bold),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: floatingActBtn(),
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
