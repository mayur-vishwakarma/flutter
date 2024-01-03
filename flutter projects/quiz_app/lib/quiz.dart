import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/StartScreen.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void onRestart() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers = [];
    });
  }

  void choosedAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: choosedAnswer);
    }
    if (activeScreen == 'result-screen') {
      screenWidget =
          ResultScreen(chosenAnswer: selectedAnswers, onRestart: onRestart);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade300, Colors.purple.shade800],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
