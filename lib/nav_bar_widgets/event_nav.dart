import 'package:flutter/material.dart';

class event_nav extends StatelessWidget {
  const event_nav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => EventListPage(userData: data)),
        // );
      },
      child: Image.asset(
        'assets/3Lines.png',
        width: 20,
        height: 20,
      ),
    );
  }
}
