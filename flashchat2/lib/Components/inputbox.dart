import 'package:flutter/material.dart';
import 'package:flashchat/constant.dart';

class InputBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: kInputBoxStyle,
    );
  }
}