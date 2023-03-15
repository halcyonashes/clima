import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';

import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    try {
      Location location = Location();
      await location.getCurrentData();
      print(location.longitude);
      print(location.latitude);
    } catch (e) {}
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
