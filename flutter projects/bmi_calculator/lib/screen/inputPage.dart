import 'package:bmi_calculator/assets/calculatorBrain.dart';
import 'package:bmi_calculator/screen/resultPage.dart';
import 'package:bmi_calculator/widgets/BottomButton.dart';
import 'package:bmi_calculator/widgets/GenderSelection.dart';
import 'package:bmi_calculator/widgets/HeightSelector.dart';
import 'package:bmi_calculator/widgets/ReuseableCard.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/assets/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/WeightAndAge.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() {
    return _InputPageState();
  }
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int selectedheight = 180;
  int selectedWeight = 50;
  int selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    void ontap() {
      CalculatorBrain calc =
          CalculatorBrain(height: selectedheight, weight: selectedWeight);
      selectedGender ??= Gender.male;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return ResultPage(
              bmiResult: calc.calculateBmi(),
              interpretation: calc.getInterpretation(),
              resultText: calc.getResult(),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReuseableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: const GenderSelection(
                        label: 'MALE',
                        genderIcon: Icon(FontAwesomeIcons.mars),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReuseableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: const GenderSelection(
                        label: "FEMALE",
                        genderIcon: Icon(FontAwesomeIcons.venus),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: kActiveCardColour,
              cardChild: HeightSelector(height: selectedheight),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild:
                        WeightAndAge(label: "WEIGHT", value: selectedWeight),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild: WeightAndAge(label: "AGE", value: selectedAge),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(title: 'Calculate', ontap: ontap),
        ],
      ),
    );
  }
}
