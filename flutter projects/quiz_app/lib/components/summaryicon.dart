import 'package:flutter/material.dart';

class SummaryIcon extends StatelessWidget {
  const SummaryIcon(
      {super.key, required this.questionIndex, required this.isCorrect});

  final int questionIndex;
  final bool isCorrect;
  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrect ? Colors.green.shade300 : Colors.red.shade300,
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        questionNumber.toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.purple.shade900),
      ),
    );
  }
}
