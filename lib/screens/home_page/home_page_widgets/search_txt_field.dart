import 'package:flutter/material.dart';

class SearchTxtField extends StatelessWidget {
  const SearchTxtField({super.key, required this.controller});
  final TextEditingController controller;
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
      width: 360,
      height: 45,
      child: Row(
        children: [
          Container(
            width: 270,
            height: 45,
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Session',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 178, 173, 173),
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 25),
          Container(
            width: 25,
            height: 25,
            child: Image.asset('assets/Search.png'),
          ),
        ],
      ),
    );
  }
}
