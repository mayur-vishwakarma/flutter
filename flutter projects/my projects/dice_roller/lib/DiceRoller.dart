import 'package:flutter/material.dart';
import 'dart:math';

Random randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int diceFace = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "asset/images/dice-$diceFace.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              setState(() {
                diceFace = randomizer.nextInt(6) + 1;
              });
            },
            child: const Text(
              "Roll Dice",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ))
      ],
    );
  }
}
