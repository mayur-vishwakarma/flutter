import 'package:flutter/material.dart';
import 'package:bmi_calculator/screen/inputPage.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
