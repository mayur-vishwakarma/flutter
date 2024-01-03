import 'package:flutter/material.dart';
import 'package:assignment1/question3.dart';

class Question2 extends StatelessWidget {
  const Question2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.yellow],
                      tileMode: TileMode.clamp)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Question3();
                  }));
                },
                child: const Text("Question 3"))
          ],
        ),
      ),
    );
  }
}
