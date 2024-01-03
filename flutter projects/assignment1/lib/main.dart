import 'package:flutter/material.dart';
import 'package:assignment1/question2.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Question1(),
    ),
  ));
}

class Question1 extends StatelessWidget {
  const Question1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 200,
          width: 200,
          decoration:
              BoxDecoration(color: Colors.red.shade200, shape: BoxShape.circle),
          child: const Center(child: Text("Mayur Vishwakarma")),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Question2();
              }));
            },
            child: const Text("Question 2"))
      ]),
    );
  }
}
