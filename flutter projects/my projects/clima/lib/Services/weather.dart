import 'package:clima/Services/LocationHelper.dart';
import 'package:clima/utility/constants.dart';

import 'package:clima/Services/location.dart';

class WeatherModel {
  Future<dynamic> cityWeatherData(String cityName) async {
    var url = "$api?q=$cityName&appid=$apikey&units=metric";
    LocationHelper locationHelper = LocationHelper(
        url:url);

    dynamic weatherdata = await locationHelper.getData();
    return weatherdata;
  }

  Future<dynamic> LocationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    LocationHelper locationHelper = LocationHelper(
        url:
            "$api?lat=${location.lat}&lon=${location.long}&appid=$apikey&units=metric");

    dynamic weatherdata = await locationHelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
