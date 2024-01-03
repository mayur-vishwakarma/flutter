import 'package:flutter/material.dart';
import 'package:assignment1/question4.dart';

class Question3 extends StatefulWidget {
  const Question3({super.key});

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  int imageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/dice$imageNumber.png",
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (imageNumber < 3) {
                    imageNumber++;
                  }
                });
              },
              child: const Text("next Images")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Question4();
                }));
              },
              child: const Text('Question 4'))
        ],
      ),
    );
  }
}
