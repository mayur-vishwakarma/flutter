import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80,
  color: Colors.white,
);

const kMessageTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 50, color: Colors.white);

const kButtonTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 30, color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 100,
);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

const api = 'https://api.openweathermap.org/data/2.5/weather';
const apikey = 'use ur own api key';
