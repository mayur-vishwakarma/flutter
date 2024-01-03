import 'package:flutter/material.dart';
import 'package:assignment1/Question5.dart';

class Question4 extends StatelessWidget {
  const Question4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset("assets/images/dice1.png")),
                Expanded(child: Image.asset("assets/images/dice2.png")),
                Expanded(child: Image.asset("assets/images/dice3.png")),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text("dice1")),
                Expanded(child: Text("dice2")),
                Expanded(child: Text("dice3")),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Question5();
                  }));
                },
                child: const Text("Question5"))
          ],
        ),
      ),
    );
  }
}
