import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const int kHttpSuccessCode = 200;
const String kOpenWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';
const String kOpenWeatherMapAPIKey = 'a39254c4ce77af790f4632bebdece168';
const kInputDecorationStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    FontAwesomeIcons.city,
    color: Colors.white,
  ),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  hintText: 'Enter City Name',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

enum Choice {
  coords,
  choose,
}
