import 'package:flutter/material.dart';
import 'package:todo_application/Model/task.dart';

class TaskListProvider extends ChangeNotifier {
  List<Task> taskList = [
    Task(taskName: "Buy Fruits"),
    Task(taskName: "Buy Vegetables"),
  ];

  List get getList => taskList;

  void addTask(String taskName) {
    taskList.add(Task(taskName: taskName));
    notifyListeners();
  }

  Future<void> deleteTask(int index) async {
    await Future.delayed(const Duration(seconds: 2));
    taskList.removeAt(index);
    notifyListeners();
  }
}
