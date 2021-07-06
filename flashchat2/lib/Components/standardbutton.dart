import 'package:flutter/material.dart';
import 'package:flashchat/constant.dart';

class StandardButton extends StatelessWidget {
  StandardButton({required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom (
        primary: Colors.lightBlueAccent,
      ),
      onPressed: onPressed, 
      child: Text(
        this.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
    );
  }
}