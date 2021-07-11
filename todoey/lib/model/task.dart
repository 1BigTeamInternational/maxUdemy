import 'package:flutter/material.dart';

class Task {

  Task({required this.title});

  String title;
  TextDecoration titleStyle = TextDecoration.none;
  bool isDone = false;
  
  void toggleDone () {
    isDone = !isDone;
  }
}