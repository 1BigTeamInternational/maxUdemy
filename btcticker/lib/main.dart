import 'package:flutter/material.dart';
import 'package:btcticker/screens/loading.dart';
import 'package:btcticker/screens/home.dart';

void main() => runApp(Setup());

class Setup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
      },
    );
  }
}
