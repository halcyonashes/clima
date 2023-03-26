import 'package:clima/services/location.dart';

import 'networking.dart';

const apiKey = 'e630fcd338a0a89d6a45b0555dd2deb1';
const unit = 'metric';
const openMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationData() async {
    try {
      Location location = Location();
      await location.getCurrentData();

      double lat = location.latitude;
      double lon = location.longitude;

      print(location.longitude);
      print(location.latitude);

      String url = '$openMapURL?lat=$lat&lon=$lon&appid=$apiKey&units=$unit';
      NetworkHelper networkHelper = NetworkHelper(url);

      var weatherData = await networkHelper.getData();

      return weatherData;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getCityNameWeather(String cityName) async {
    var url = '$openMapURL?q=$cityName&appid=$apiKey&units=$unit';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;
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
