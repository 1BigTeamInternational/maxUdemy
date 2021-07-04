import 'package:flutter/material.dart';
import 'package:clima/utilities/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location loc = Location();

    await loc.getCurrentLocationData();

    // pushReplacementNamed() replaces the previous screens instead of letting it 
    // stay in the background
    // in order to pass arguments to the home screen, we use arguments: to push to 
    // a Map variable in home screen
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'city': loc.city,
      'temp': loc.temp,
      'weatherIcon': loc.weatherIcon,
      'weatherMsg': loc.weatherMsg,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
