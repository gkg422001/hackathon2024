import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF1B3B6F),
          width: 2.0,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      width: 350,
      height: 45,
      child: Row(
        children: [
          Container(
            width: 270,
            height: 45,
            child: TextField(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title of the Event',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 178, 173, 173),
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 20,
            height: 20,
            child: Image.asset('assets/Search.png'),
          ),
        ],
      ),
    );
  }
}
