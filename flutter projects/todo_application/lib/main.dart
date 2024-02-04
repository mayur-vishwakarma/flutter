import 'package:flutter/material.dart';
import 'package:todo_application/Providers/task_provider.dart';
import 'package:todo_application/Screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>TaskListProvider()),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
    ),);
  }
}
