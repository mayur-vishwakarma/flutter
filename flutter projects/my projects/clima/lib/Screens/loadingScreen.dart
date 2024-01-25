import 'package:clima/Screens/locationScreen.dart';
import 'package:clima/Services/weather.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    dynamic weatherdata = await WeatherModel().LocationWeatherData();
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) {
          return LocationScreen(
            weatherdata: weatherdata,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
