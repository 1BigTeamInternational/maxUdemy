import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:clima/utilities/constant.dart';
import 'dart:convert' as convert;

class Location {
  double lat;
  double long;
  double temp;
  String city;
  int weatherCondition;
  String weatherIcon;
  String weatherMsg;

  Future<Map> getCurrentLocationData() async {
    await getCurrentLocation();
    await getLocationWeather(Choice.coords, null);
    return {
      'city': city,
      'temp': temp,
      'weatherIcon': weatherIcon,
      'weatherMsg': weatherMsg,
    };
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      print(e);
    } //try-catch
  } //getCurrentLocation()

  Future<void> getLocationWeather(dynamic choice, String choosenLoc) async {
    http.Response response;

    try {
      if (choice == Choice.coords) {
         response = await http.get(Uri.parse(
            '$kOpenWeatherMapURL?lat=$lat&lon=$long&appid=$kOpenWeatherMapAPIKey&units=metric'));
      } else {
        response = await http.get(Uri.parse(
            '$kOpenWeatherMapURL?q=$choosenLoc&appid=$kOpenWeatherMapAPIKey&units=metric'));
      }
      // Status Code Legend
      // 1** = Hang on
      // 2** = Success
      // 3** = No Access
      // 4** = You are screwed
      // 5** = I am screwed
      if (response.statusCode == kHttpSuccessCode) {
        updateVariables(convert.jsonDecode(response.body));
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    } //try-catch
  } //getLocationWeather()

  void updateVariables(Map data) {
    temp = data['main']['temp'];
    city = data['name'];
    weatherCondition = data['weather'][0]['id'];
    weatherIcon = getWeatherIcon();
    weatherMsg = getWeatherMsg();
  }

  String getWeatherIcon() {
    if (weatherCondition < 300) {
      return '⛈️';
    } else if (weatherCondition < 400) {
      return '☔';
    } else if (weatherCondition < 600) {
      return '🌧️';
    } else if (weatherCondition < 700) {
      return '🌨️';
    } else if (weatherCondition < 800) {
      return '🌪️';
    } else if (weatherCondition == 800) {
      return '😎';
    } else if (weatherCondition <= 804) {
      return '🌥️';
    } else {
      return '🤷🏻‍♀️';
    }
  }

  String getWeatherMsg() {
    if (temp > 30) {
      return 'It\'s 🍦 time!';
    } else if (temp > 20) {
      return 'Time for 🩳 and 🎽';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
