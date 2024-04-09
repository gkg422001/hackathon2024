import 'package:flutter/material.dart';
import 'package:hackathon/screens/home_page/home_page.dart';

class home_nav extends StatelessWidget {
  const home_nav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      child: Container(
        padding: EdgeInsets.zero,
        child: Image.asset(
          'assets/Home.png',
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
