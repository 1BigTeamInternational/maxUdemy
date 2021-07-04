import 'package:btcticker/services/cardcontent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:btcticker/services/coindata.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    setupCoinData();
    // Future.delayed(Duration(milliseconds: 100)).then((_) {
    //   Navigator.pushReplacementNamed(context, '/home');
    // });
  }

  void setupCoinData() async {
    List <Widget> coinsTicker = [];
    String xRate;
    String currency = 'USD';

    for (String coin in cryptoList) {
      xRate = await CoinData().getCoinExchangeRate(coin, currency);
      //print(xRate);
      coinsTicker.add(CardContent(coin: coin, xchangeRate: xRate, selectedCurrency: currency));
    }

    Navigator.pushReplacementNamed(context, '/home', arguments: {
        'ticker': coinsTicker,
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SpinKitThreeBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
