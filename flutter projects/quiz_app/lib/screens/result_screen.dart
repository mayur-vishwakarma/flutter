import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/components/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.onRestart});

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question_text': questions[i].text,
        'user_answer': chosenAnswer[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numberTotalQuestions = questions.length;
    final numberCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numberCorrectQuestions out of $numberTotalQuestions Questions correctly",
              style: TextStyle(color: Colors.purple.shade100, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summarydata: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  onRestart();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.reset_tv_rounded,
                      color: Colors.purple.shade100,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Restart",
                      style: TextStyle(
                          fontSize: 18, color: Colors.purple.shade100),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
