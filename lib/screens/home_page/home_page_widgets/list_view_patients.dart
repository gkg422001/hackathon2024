import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/models.dart';
import 'package:hackathon/screens/session_page/session_page.dart';

class list_view_patients extends StatelessWidget {
  const list_view_patients({
    super.key,
    required List<Patient> foundPatients,
  }) : _foundPatients = foundPatients;

  final List<Patient> _foundPatients;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 550,
      // decoration: BoxDecoration(color: Colors.blue),
      child: ListView.builder(
        itemCount: _foundPatients.length,
        itemBuilder: (context, index) {
          Patient patient = _foundPatients[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => SessionPage(
                      name: '${patient.FirstName} ${patient.LastName}',
                    ),
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(1, 4),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(
                          Icons.person,
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      customText(
                          text: '${patient.FirstName} ${patient.LastName}',
                          color: Colors.black,
                          size: 18,
                          weight: FontWeight.w400),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
