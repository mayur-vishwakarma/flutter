import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Providers/task_provider.dart';
import 'package:todo_application/Widgets/listview.dart';
import 'package:todo_application/Widgets/bottomsheet.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListProvider>(
      builder: (context, listProviderModel, child) => Scaffold(
        backgroundColor: Colors.blue,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (ctx) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const BottomSheetToAddTask(),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.blue.shade400,
                Colors.blue.shade300,
                Colors.blue.shade100,
                Colors.blue.shade50
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, top: 60),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Icon(
                      size: 50,
                      Icons.list,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, top: 10),
                  child: Text(
                    "Todoey",
                    style: TextStyle(fontSize: 50, color: Colors.blue.shade900),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, top: 5),
                  child: Text(
                    "${listProviderModel.taskList.length} Tasks",
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: const ListviewWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
