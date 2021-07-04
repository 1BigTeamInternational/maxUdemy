import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue[800],
      ),
      body: MagicBall(),
    ),
  ));
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: (){
          setState((){
            ballNumber = Random().nextInt(5) + 1;
          }); 
          print(ballNumber);
        },
        child: Image.asset('images/ball$ballNumber.png'),
      ),
    );
  }
}