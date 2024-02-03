import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue.shade600,
            Colors.blue.shade400,
            Colors.blue.shade200,
            Colors.blue.shade50
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: const Center(
          child: Text("Task Screen"),
        ),
      ),
    );
  }
}
