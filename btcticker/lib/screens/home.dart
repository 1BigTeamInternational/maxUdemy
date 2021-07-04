import 'package:flutter/material.dart';
import 'package:btcticker/services/cardcontent.dart';
import 'package:btcticker/services/coindata.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCurrency = 'USD';
  dynamic data;
  bool firstTimeSetup = true;

  void displayCoinTicker() async {
    List<Widget> coinsTicker = [];
    String xRate;

    for (String coin in cryptoList) {
      xRate = await CoinData().getCoinExchangeRate(coin, selectedCurrency);
      print(xRate + ' $selectedCurrency');
      coinsTicker.add(
        CardContent(
            coin: coin, xchangeRate: xRate, selectedCurrency: selectedCurrency),
      );
    }
    setState(() {
      data = Column(
        children: coinsTicker,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (firstTimeSetup) {
      data = ModalRoute.of(context)!.settings.arguments;
      data = Column(
        children: data['ticker'],
      );
      firstTimeSetup = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // CardContent('1 $selectedCoin = $xchangeRate $selectedCurrency'),
          data,
          Container(
            alignment: Alignment.center,
            color: Colors.lightBlue,
            height: 150.0,
            child: Platform.isIOS ? getiOSMenu() : getAndroidMenu(),
          ),
        ],
      ),
    );
  }

  DropdownButton getAndroidMenu() {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        value: currency,
      );
      dropdownMenuItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownMenuItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value.toString();
          displayCoinTicker();
        });
      },
    );
  }

  CupertinoPicker getiOSMenu() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(
        Text(
          currency,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = pickerItems[selectedIndex].data.toString();
          displayCoinTicker();
        });
      },
      children: pickerItems,
    );
  }
}
