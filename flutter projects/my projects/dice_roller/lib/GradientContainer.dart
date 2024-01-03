// ignore: file_names
import 'package:flutter/material.dart';
import 'DiceRoller.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
    this.color1,
    this.color2, {
    super.key,
  });

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [color1, color2],
      )),
      child: const DiceRoller(),
    );
  }
}
