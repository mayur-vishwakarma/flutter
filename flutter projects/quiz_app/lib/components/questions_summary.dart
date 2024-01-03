import 'package:flutter/material.dart';
import 'package:quiz_app/components/summaryItems.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summarydata.map((data) {
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: SummaryItems(
                  itemData: data,
                ));
          }).toList(),
        ),
      ),
    );
  }
}
