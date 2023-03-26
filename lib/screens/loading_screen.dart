import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

const apiKey = 'e630fcd338a0a89d6a45b0555dd2deb1';
const unit = 'metric';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat, lon;

  void getLocationDate() async {
    try {
      Location location = Location();
      await location.getCurrentData();

      lat = location.latitude;
      lon = location.longitude;

      print(location.longitude);
      print(location.latitude);

      String url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=$unit';
      NetworkHelper networkHelper = NetworkHelper(url);

      var weatherData = await networkHelper.getData();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    getLocationDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
