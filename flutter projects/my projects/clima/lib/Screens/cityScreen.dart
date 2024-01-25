import 'package:flutter/material.dart';
import 'package:clima/utility/Constants.dart';


class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/city_background.jpg'),
              fit: BoxFit.cover),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityname = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  
                  Navigator.pop(context,cityname);
                },
                child: const Text(
                  "Get Whetther",
                  style: kButtonTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
