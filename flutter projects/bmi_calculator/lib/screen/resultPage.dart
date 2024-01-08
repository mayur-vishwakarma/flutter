import 'package:bmi_calculator/assets/constants.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/widgets/BottomButton.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

      
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    void ontap() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const Text(
            "Your Result",
            style: kResultLabelTextStyle,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFF1D1E33),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kResultNumberTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kResultMessageTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(title: 'Re - Calculate', ontap: ontap),
        ],
      ),
    );
  }
}
