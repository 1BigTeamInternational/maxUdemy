import 'package:bmicalculator/Components/bottombutton.dart';
import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/bmidata.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.result});

  final BMIData result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.all(20.0),
              color: Color(kActiveCardBGColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result.status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[300],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    result.bmi.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    result.rangeLabel,
                    style: kLabelTextStyle,
                  ),
                  Text(
                    result.range,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    result.statement,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            label: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
