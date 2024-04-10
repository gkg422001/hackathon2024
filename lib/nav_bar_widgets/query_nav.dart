import 'package:flutter/material.dart';
import 'package:hackathon/screens/query_page/query_page.dart';

class query_nav extends StatelessWidget {
  query_nav({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QueryPage(
                    index: index,
                  )),
        );
      },
      child: Image.asset(
        'assets/Query.png',
        width: 20,
        height: 20,
      ),
    );
  }
}
