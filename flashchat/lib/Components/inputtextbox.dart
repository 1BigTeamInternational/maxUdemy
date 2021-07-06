import 'package:flashchat/constant.dart';
import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {

  InputTextBox({required this.hintText, this.onChanged, required this.obscureText});
  final String hintText;
  final Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
      child: TextField(
        decoration: kInputBoxStyle.copyWith(
          hintText: this.hintText,
        ),
        obscureText: this.obscureText,
        onChanged: this.onChanged,
      ),
    );
  }
}