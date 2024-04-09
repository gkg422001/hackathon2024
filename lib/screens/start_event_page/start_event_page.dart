import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/screens/start_event_page/start_event_page_widgets/back_btn.dart';
import 'package:hackathon/screens/start_event_page/start_event_page_widgets/search_bar.dart';
import 'package:hackathon/screens/start_event_page/start_event_page_widgets/session_cont.dart';

class StartEventPage extends StatelessWidget {
  const StartEventPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF0F3),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backBtn(),
            SizedBox(
              height: 20,
            ),
            customText(
                text: 'Start Session',
                color: Color(0xFF1B3B6F),
                size: 30,
                weight: FontWeight.bold),
            SizedBox(
              height: 20,
            ),
            searchBar(),
            SizedBox(
              height: 25,
            ),
            sessionCont(),
            Spacer(),
            // startEventBtn(
            //   username: username,
            // ),
          ],
        ),
      ),
    );
  }
}
