import 'package:flutter/material.dart';

class CustomMatrialButton extends StatelessWidget {
  const CustomMatrialButton(
      {super.key, required this.name, required this.onPressed});
  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
