import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  label: Text(
    "Enter Email",
    style: TextStyle(
      color: Colors.amber,
      fontSize: 20,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amber, width: 3),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amber),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
