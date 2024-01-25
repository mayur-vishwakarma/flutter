import 'package:clima/Screens/cityScreen.dart';
import 'package:clima/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/Services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.weatherdata});
  final dynamic weatherdata;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel whether = WeatherModel();
  int? temp;
  String? city;
  int? condition;
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherdata);
  }

  void updateUI(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        return;
      }
      double temp1 = weatherdata['main']['temp'];
      temp = temp1.toInt();
      condition = weatherdata['weather'][0]['id'];
      city = weatherdata['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/location_background.jpg'),
              fit: BoxFit.cover),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    var weatherdata = await whether.LocationWeatherData();
                    updateUI(weatherdata);
                  },
                  child: const Icon(
                    Icons.near_me,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var typedName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const CityScreen();
                        },
                      ),
                    );
                    if (typedName != null) {
                      var weatherdata = await whether.cityWeatherData(typedName);
                      updateUI(weatherdata);
                    }
                  },
                  child: const Icon(
                    Icons.location_city,
                    size: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    '$temp°C',
                    style: kTempTextStyle,
                  ),
                  Text(
                    whether.getWeatherIcon(condition!),
                    style: kConditionTextStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                '${whether.getMessage(temp!)} in $city',
                style: kMessageTextStyle,
              ),
            )
          ],
        )),
      ),
    );
  }
}
