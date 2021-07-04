import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clima/utilities/location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map locationData;
  String temp;
  String city;
  String weatherMsg;
  String weatherIcon;
  bool firstTimeSetup = true;

  void updateUI() {
    temp = '${locationData['temp'].toStringAsFixed(1)}°C';
    city = locationData['city'];
    weatherMsg = locationData['weatherMsg'];
    weatherIcon = locationData['weatherIcon'];
    // print('updating ui');
    // print(temp);
  }

  @override
  Widget build(BuildContext context) {
    if (firstTimeSetup) {
      // To receive the arguments from Loading()
      // city and temp
      locationData = ModalRoute.of(context).settings.arguments;
      updateUI();
      firstTimeSetup = false;
    }

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      Location locData = Location();
                      locationData = await locData.getCurrentLocationData();
                      setState(() {
                        updateUI();
                      });
                    },
                    icon: Icon(
                      FontAwesomeIcons.locationArrow,
                      size: 50.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: IconButton(
                      onPressed: () async {
                        dynamic locData =
                            await Navigator.pushNamed(context, '/chooseloc');
                        if (locData != null) {
                          locationData['city'] = locData.city;
                          locationData['temp'] = locData.temp;
                          locationData['weatherIcon'] = locData.weatherIcon;
                          locationData['weatherMsg'] = locData.weatherMsg;
                          setState(() {
                            updateUI();
                          });
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.city,
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    temp,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherIcon,
                    style: TextStyle(
                      fontSize: 80.0,
                    ),
                  ),
                ],
              ),
              Text(
                '$weatherMsg in $city',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
