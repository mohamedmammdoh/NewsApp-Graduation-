import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hinttext,
    required this.labeltext,
    @required this.suffixIcon,
    required this.prefixIcon,
    required this.validation,
    required this.controller,
    required this.keyboardType,
    required this.isobsure,
  });
  final String labeltext;
  final String hinttext;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final String? Function(String?)? validation;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isobsure;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.isobsure,
      validator: widget.validation,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        labelText: widget.labeltext,
        labelStyle: TextStyle(color: Colors.white),
        hintText: widget.hinttext,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        // suffixIcon: IconButton(
        //   onPressed: () {
        //     setState(
        //       () {
        //         isObsure = !isObsure;
        //       },
        //     );
        //   },
        //   icon: Icon(
        //     isObsure ? Icons.visibility : Icons.visibility_off,
        //   ),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
