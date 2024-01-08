import 'package:flutter/material.dart';
import 'package:bmi_calculator/assets/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.title,
    required this.ontap,
  });

  final String title;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        height: bottomContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15),
        color: kActiveBottomButton,
        child: Center(
          child: Text(title,
            style: kBottomContainerTextStyle,
          ),
        ),
      ),
    );
  }
}
