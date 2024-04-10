import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/nav_bar_widgets/query_nav.dart';
import 'package:hackathon/nav_bar_widgets/home_nav.dart';
import 'package:hackathon/screens/home_page/home_page.dart';
import 'package:hackathon/screens/query_page/query_page_widgets/query_txt_field.dart';
import 'package:hackathon/screens/query_page/query_page_widgets/smart_txt.dart';

class QueryPage extends StatefulWidget {
  QueryPage({super.key, required this.index});
  final int index;
  @override
  _QueryState createState() => _QueryState();
}

class _QueryState extends State<QueryPage> {
  int _currentIndex = 0;
  final TextEditingController cntr = TextEditingController();
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
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
            smart_query_txt(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 600,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(
              height: 15,
            ),
            queryTxtField(
              controller: cntr,
            ),
          ],
        ),
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
