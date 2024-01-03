import 'package:flutter/material.dart';
import 'package:quiz_app/components/summaryicon.dart';

class SummaryItems extends StatelessWidget {
  const SummaryItems({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrect = itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryIcon(
            isCorrect: isCorrect,
            questionIndex: itemData['question_index'] as int),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question_text'].toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade100),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['correct_answer'].toString(),
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, color: Colors.green.shade300),
              ),
              Text(
                itemData['user_answer'].toString(),
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, color: Colors.red.shade300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
