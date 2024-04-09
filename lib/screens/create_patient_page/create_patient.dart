import 'package:flutter/material.dart';
import 'package:hackathon/custom_text_widget/custom_text.dart';
import 'package:hackathon/screens/create_patient_page/create_patient_widgets/age_cont.dart';
import 'package:hackathon/screens/create_patient_page/create_patient_widgets/back_btn.dart';
import 'package:hackathon/screens/create_patient_page/create_patient_widgets/email_cont.dart';
import 'package:hackathon/screens/create_patient_page/create_patient_widgets/first_name_cont.dart';
import 'package:hackathon/screens/create_patient_page/create_patient_widgets/last_name_cont.dart';
import 'package:hackathon/screens/create_patient_page/create_patient_widgets/mobile_cont.dart';
import 'package:hackathon/screens/create_patient_page/create_patient_widgets/submit_btn.dart';
import 'package:hackathon/screens/home_page/home_page.dart';

class patientForm extends StatefulWidget {
  const patientForm({super.key});
  @override
  State<patientForm> createState() => _patientFormState();
}

class _patientFormState extends State<patientForm> {
  String groupValue = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            back(),
            SizedBox(
              height: 180,
            ),
            fname_cont(),
            SizedBox(
              height: 10,
            ),
            lname_cont(),
            SizedBox(
              height: 10,
            ),
            mobile_cont(),
            SizedBox(
              height: 10,
            ),
            email_cont(),
            SizedBox(
              height: 10,
            ),
            age_cont(),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                height: 50,
                width: 210,
                child: Row(
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    ),
                    customText(
                        text: 'Male',
                        color: Colors.black,
                        size: 16,
                        weight: FontWeight.w400),
                    SizedBox(
                      width: 15,
                    ),
                    Radio(
                      value: 'Female',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    ),
                    customText(
                        text: 'Female',
                        color: Colors.black,
                        size: 16,
                        weight: FontWeight.w400),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
