import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/models.dart';
import 'package:hackathon/nav_bar_widgets/query_nav.dart';
import 'package:hackathon/nav_bar_widgets/home_nav.dart';
import 'package:hackathon/nav_bar_widgets/profile_nav.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/search_txt_field.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/floating_act_btn.dart';
import 'package:hackathon/screens/home_page/home_page_widgets/user_greeting_cont.dart';
import 'package:hackathon/screens/query_page/query_page.dart';
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
  final TextEditingController cntr = TextEditingController();
  List<Patient> _foundPatients = [];
  @override
  void initState() {
    _fetchPatients();
    super.initState();
    _currentIndex = widget.index;
  }

  Future<void> _fetchPatients() async {
    try {
      List<Patient> friends = await ApiService().fetchData();
      setState(() {
        _foundPatients = friends;
      });
    } catch (e) {
      print("Failed");
      // Handle any errors
      print(e);
    }
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
            SearchTxtField(controller: cntr),
            SizedBox(
              height: 160,
            ),
            _foundPatients.isEmpty
                ? Column(
                    children: [
                      customText(
                        text: 'No Patient',
                        color: Color.fromARGB(255, 192, 184, 184),
                        size: 45,
                        weight: FontWeight.bold,
                      ),
                      customText(
                        text: 'Yet',
                        color: Color.fromARGB(255, 192, 184, 184),
                        size: 45,
                        weight: FontWeight.bold,
                      ),
                    ],
                  )
                : Container(
                    width: 200,
                    height: 350,
                    child: ListView.builder(
                      itemCount: _foundPatients.length,
                      itemBuilder: (context, index) {
                        Patient patient = _foundPatients[index];
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 177, 176, 176)),
                          child: customText(
                              text: patient.FirstName,
                              color: Colors.black,
                              size: 15,
                              weight: FontWeight.w400),
                        );
                      },
                    ),
                  ),
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
