import 'package:flutter/material.dart';

class infoTxtField extends StatelessWidget {
  const infoTxtField({
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
      height: 200,
      child: Row(
        children: [
          Container(
            width: 270,
            height: 200,
            child: TextField(
              textInputAction: TextInputAction.done,
              maxLines: null,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Information Input',
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
            child: Image.asset('assets/upload.png'),
          ),
        ],
      ),
    );
  }
}
