import 'package:flutter/material.dart';
import 'package:todoey/Screens/todoeyscreen.dart';

void main() => runApp(TodoeySetup());

class TodoeySetup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoeyScreen(),
    );
  }
}
