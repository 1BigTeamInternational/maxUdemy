import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.text, this.color, required this.onPressed});

  final VoidCallback onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: this.color,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          this.text,
        ),
      ),
    );
  }
}
