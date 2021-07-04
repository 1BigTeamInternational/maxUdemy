import 'package:flutter/material.dart';
import 'package:clima/screens/home.dart';
import 'package:clima/screens/loading.dart';
import 'package:clima/screens/chooselocation.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/chooseloc': (context) => ChooseLocation(),
    },
    theme: ThemeData.dark(),
  ));
}

