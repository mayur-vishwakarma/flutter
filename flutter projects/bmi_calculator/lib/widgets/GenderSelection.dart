import 'package:flutter/material.dart';
import 'package:bmi_calculator/screen/inputPage.dart';
import 'package:bmi_calculator/assets/constants.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection(
      {super.key, required this.label, required this.genderIcon, required this.onGenderSelected});

  final String label;
  final Icon genderIcon;
  final Function(Gender) onGenderSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon.icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kGenderLabelTextStyle,
        )
      ],
    );
  }
}
