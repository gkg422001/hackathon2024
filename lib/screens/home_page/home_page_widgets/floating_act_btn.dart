import 'package:flutter/material.dart';
import 'package:hackathon/screens/create_patient_page/create_patient.dart';
import 'package:hackathon/screens/session_page/session_page.dart';

class floatingActBtn extends StatelessWidget {
  const floatingActBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 745,
          right: 170,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => patientForm(),
                ),
              );
            },
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF009340),
            child: Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
