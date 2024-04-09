import 'package:flutter/material.dart';

class profile_nav extends StatelessWidget {
  const profile_nav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => ProfilePage(userData: data)),
        // );
      },
      child: Image.asset(
        'assets/Profile.png',
        width: 20,
        height: 20,
      ),
    );
  }
}
