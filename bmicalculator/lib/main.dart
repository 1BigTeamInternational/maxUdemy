import 'package:flutter/material.dart';
import 'package:bmicalculator/Screens/bmiapp.dart';
void main() => runApp(BMIAppSetup());

class BMIAppSetup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //copyWith() allows you to customize the finer details of the theme
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
         scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: BMIApp(),
    );
  }
}
