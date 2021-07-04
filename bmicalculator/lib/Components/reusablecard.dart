import 'package:flutter/material.dart';

const double kStdCardMargin = 15.0;
const double kStdCardBorderRadius = 10.0;

class ReusableCard extends StatelessWidget {
  //@required keyword tells that object must have this input
  //the child Widget is needed for customizing the Widget
  // e.g. Allowing ReusableCard object to have a child property
  //the onPressed function allows this widget to have the capability to tell the widget
  //what to do when on tapp
  ReusableCard({@required this.color, this.child, this.onPressed});

  final int color;
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(kStdCardMargin),
        decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.circular(kStdCardBorderRadius),
        ),
      ),
    );
  }
}
