import 'package:clima/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clima/utilities/location.dart';

class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                alignment: Alignment.topLeft,
                icon: Icon(
                  FontAwesomeIcons.arrowLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kInputDecorationStyle,
                  onChanged: (value) {
                    city = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  Location locData = Location();
                  await locData.getLocationWeather(Choice.choose, city);
                  Navigator.pop(context, locData);
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}