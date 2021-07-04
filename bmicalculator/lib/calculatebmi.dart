import 'dart:math';
import 'package:bmicalculator/bmidata.dart';

class CalculateBMI {
  final int weight;
  final int height;
  double _bmi;

  CalculateBMI({this.height, this.weight});

  BMIData getResult() {
    _bmi = weight / pow(height / 100, 2);

    if (_bmi >= 30) {
      return BMIData(
          status: 'OBESE',
          bmi: _bmi,
          rangeLabel: 'Obese BMI Range:',
          range: '30.0 and above',
          statement: 'You are obese! You need help!');
    } else if (_bmi >= 25) {
      return BMIData(
          status: 'OVERWEIGHT',
          bmi: _bmi,
          rangeLabel: 'Overweight BMI Range:',
          range: '25 - 29.9 kg/m2',
          statement: 'You are overweight. Please exercise!');
    } else if (_bmi >= 18.5) {
      return BMIData(
          status: 'NORMAL',
          bmi: _bmi,
          rangeLabel: 'Normal BMI Range:',
          range: '18.5 - 24.9 kg/m2',
          statement: 'You have a normal body weight. Good job!');
    } else {
      return BMIData(
        status: 'UNDERWEIGHT',
        bmi: _bmi,
        rangeLabel: 'Underweight BMI Range:',
        range: 'Below 18.5',
        statement: 'You are underweight. Please eat more!',
      );
    }
  }
}
