import 'package:flutter/material.dart';

class CardContent extends StatelessWidget{
  
  final String xchangeRate;
  final String selectedCurrency;
  final String coin;

  const CardContent({required this.coin, required this.xchangeRate, required this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: Colors.blue,
      margin: EdgeInsets.all(15.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            '1 $coin = $xchangeRate $selectedCurrency',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
