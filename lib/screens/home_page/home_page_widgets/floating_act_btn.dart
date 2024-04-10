import 'package:flutter/material.dart';
import 'package:hackathon/screens/create_patient_page/create_patient.dart';
import 'package:hackathon/screens/session_page/session_page.dart';

class floatingActBtn extends StatelessWidget {
  const floatingActBtn({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 785,
          right: 0,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => patientForm(
                    index: index,
                  ),
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
