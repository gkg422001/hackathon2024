import 'package:flutter/material.dart';

class age_cont extends StatelessWidget {
  const age_cont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        width: 270,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(Icons.calendar_today),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              width: 200,
              height: 45,
              child: TextField(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Age',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 59, 59, 59),
                    fontSize: 15,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF9EB3C2)), // Underline color
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Underline color when focused
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
