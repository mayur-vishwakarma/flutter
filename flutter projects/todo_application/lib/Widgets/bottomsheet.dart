import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Providers/task_provider.dart';

class BottomSheetToAddTask extends StatefulWidget {
  const BottomSheetToAddTask({super.key});

  @override
  State<BottomSheetToAddTask> createState() => _BottomSheetToAddTaskState();
}

class _BottomSheetToAddTaskState extends State<BottomSheetToAddTask> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListProvider>(
      builder: (context, listProviderModel, child) => Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    listProviderModel.addTask(name);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
