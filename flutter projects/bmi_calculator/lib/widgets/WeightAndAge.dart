import 'package:flutter/material.dart';
import 'package:bmi_calculator/assets/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightAndAge extends StatefulWidget {
  WeightAndAge({
    Key? key,
    required this.value,
    required this.label,
    required this.onValueChange,
  }) : super(key: key);

  final String label;
  int? value;
  final Function(int) onValueChange;

  @override
  State<WeightAndAge> createState() {
    return _WeightAndAgeState();
  }
}

class _WeightAndAgeState extends State<WeightAndAge> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.label,
            style: kGenderLabelTextStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.value.toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: const Color(0xFF4C4F5E),
                onPressed: () {
                  setState(() {
                    widget.onValueChange(widget.value = widget.value! + 1);
                  });
                },
                child: const Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFF4C4F5E),
                onPressed: () {
                  setState(() {
                    widget.onValueChange(widget.value = widget.value! - 1);
                  });
                },
                child: const Icon(
                  FontAwesomeIcons.minus,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
