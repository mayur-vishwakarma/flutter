import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz(), {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "asset/images/quiz-logo.png",
            width: 300,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Learn Fluttter the fun way!",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
              onPressed: startQuiz,
              child: const Text("Start Quiz",
                  style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
