import 'package:flutter/material.dart';
import 'package:bmicalculator/constant.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String label;

  BottomButton({@required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        alignment: Alignment.center,
        color: Color(kBottomContainerBGColor),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity, //gives the width of any screen
        height: kBottomContainerHeight,
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
          )
        ),
      ),
    );
  }
}
