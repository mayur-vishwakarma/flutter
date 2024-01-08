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
  int selectedheight = 160;
  int selectedWeight = 60;
  int selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    void ontap() {
      print("$selectedWeight    -    $selectedheight");
      CalculatorBrain calc =
          CalculatorBrain(height: selectedheight, weight: selectedWeight);
      selectedGender ??= Gender.male;
      String bmi = calc.calculateBmi();
      String interpretation = calc.getInterpretation();
      String resultText = calc.getResult();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return ResultPage(
              bmiResult: bmi,
              interpretation: interpretation,
              resultText: resultText,
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
                      cardChild: GenderSelection(
                        label: 'MALE',
                        genderIcon: const Icon(FontAwesomeIcons.mars),
                        onGenderSelected: (Gender gender) {
                          setState(() {
                            selectedGender = gender;
                          });
                        },
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
                      cardChild: GenderSelection(
                        label: "FEMALE",
                        genderIcon: const Icon(FontAwesomeIcons.venus),
                        onGenderSelected: (Gender gender) {
                          setState(() {
                            selectedGender = gender;
                          });
                        },
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
              cardChild: HeightSelector(
                  height: selectedheight,
                  onHeightChanged: (int height) {
                    setState(() {
                      selectedheight = height;
                    });
                  }),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild: WeightAndAge(
                        label: "WEIGHT",
                        value: selectedWeight,
                        onValueChange: (int weight) {
                          setState(() {
                            selectedWeight = weight;
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild: WeightAndAge(
                        label: "AGE",
                        value: selectedAge,
                        onValueChange: (int age) {
                          setState(() {
                            selectedAge = age;
                          });
                        }),
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
