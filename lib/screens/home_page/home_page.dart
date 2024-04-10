import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/models.dart';
import 'package:hackathon/nav_bar_widgets/query_nav.dart';
import 'package:hackathon/nav_bar_widgets/home_nav.dart';
import 'package:hackathon/nav_bar_widgets/profile_nav.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/list_view_patients.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/no_patients_UI.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/search_txt_field.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/floating_act_btn.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/user_greeting_cont.dart';
import 'package:hackathon/screens/query_page/query_page.dart';
import 'package:hackathon/screens/session_page/session_page.dart';
import 'package:hackathon/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.index});
  final int index;
  late ApiService apiService;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _currentIndex = 0;
  // final TextEditingController cntr = TextEditingController();
  List<Patient> _foundPatients = [];
  @override
  void initState() {
    _fetchPatients();
    super.initState();
    _currentIndex = widget.index;
  }

  Future<void> _fetchPatients() async {
    try {
      List<Patient> patients = await ApiService().fetchData();
      setState(() {
        _foundPatients = patients;
      });
    } catch (e) {
      print("Failed");
      print(e);
    }
  }

  Future<List<Patient>> _reset() async {
    try {
      List<Patient> patients = await ApiService().fetchData();
      setState(() {
        _foundPatients = patients;
      });
      return patients;
    } catch (e) {
      print("Failed");
      print(e);
      throw Exception('Failed to fetch patients');
    }
  }

  void _runFilter(String enteredKeyword) {
    // new function
    List<Patient> results = [];
    if (enteredKeyword.isEmpty) {
      results = _foundPatients;
    } else {
      // Only filter if there are characters to search
      results = _foundPatients
          .where((patient) =>
              patient.FirstName.toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              patient.LastName.toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundPatients = results;
    });
  }

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
            SearchTxtField(runFilter: _runFilter),
            SizedBox(
              height: 10,
            ),
            list_view_patients(foundPatients: _foundPatients),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: floatingActBtn(
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
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
            icon: Image.asset(
              'assets/Query.png',
              width: 20,
              height: 20,
            ),
            // icon: query_nav(
            //   index: _currentIndex,
            // ),
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
