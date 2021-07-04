import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Dicee(),
      ),
    )
  );
}

class Dicee extends StatefulWidget {

  @override
  _DiceeState createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace(){
    setState(() {

      //Random Generator will generate from 0 to 5
      //hence, we add 1 to it so that we will have 1 to 6
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    }); //setState
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget> [

          // Will expand the widget to whatever it can so that it fit the screen
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),

              //TextButton has a padding of 8.0 pixel already embedded and that is why
              //the above padding is only 8.0 pixel to achieve a 16pixel shown in the course
              child: TextButton(
                onPressed: (){
                  changeDiceFace();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),  
          ),

          Expanded(
            child: Padding(
              //TextButton has a padding of 8.0 pixel already embedded and that is why
              //the above padding is only 8.0 pixel to achieve a 16pixel shown in the course
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: (){
                  changeDiceFace();
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

