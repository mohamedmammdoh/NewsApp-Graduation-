import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'News',
            style: TextStyle(
              // color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Cloud',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
