import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Models/Constants.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function()? onEditeComplete;
  final bool obscureText;
  final TextEditingController? controller;

  const AuthTextField({
    Key? key,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    required this.obscureText,
    this.controller,
    this.onEditeComplete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: onEditeComplete,
      cursorColor: appDesign.colorPrimary,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusColor: appDesign.colorPrimary ,
        labelText: labelText,

        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: appDesign.colorPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: appDesign.colorPrimary), // Set the focused border color
        ),
      ),
      controller: controller ,
    );
  }
}