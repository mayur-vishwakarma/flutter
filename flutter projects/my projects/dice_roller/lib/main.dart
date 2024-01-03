import 'package:flutter/material.dart';
import 'package:dice_roller/GradientContainer.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Dice roller",
            ),
          ),
          backgroundColor: Colors.deepPurple[900],
        ),
        body: GradientContainer(
            Colors.deepPurple.shade900, Colors.indigo.shade200),
      ),
    ),
  );
}
