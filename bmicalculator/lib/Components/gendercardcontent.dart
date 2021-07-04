import 'package:flutter/material.dart';
import 'package:bmicalculator/constant.dart';

class GenderCardContent extends StatelessWidget {
  final String gender;
  final IconData icon;

  GenderCardContent({@required this.gender, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: kIconSize,
        ),
        SizedBox(height: 15.0),
        Text(
          this.gender,
          style: kLabelTextStyle,
          ),
      ],
    );
  }
}