import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.buttonName, required this.onPressed});
  final String buttonName;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        color: Colors.white,
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}