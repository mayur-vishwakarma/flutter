import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:todo_application/Providers/task_provider.dart';

class ListviewWidget extends StatefulWidget {
  const ListviewWidget({super.key});

  @override
  State<ListviewWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListProvider>(
      builder: (context, listProviderModel, child) => ListView.builder(
        itemCount: listProviderModel.taskList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              listProviderModel.taskList[index].taskName,
              style: TextStyle(
                decoration: listProviderModel.taskList[index].isDone
                    ? TextDecoration.lineThrough
                    : null,
                color: Colors.blue[800],
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            trailing: Checkbox(
                value: listProviderModel.taskList[index].isDone,
                onChanged: (value) {
                  setState(() {
                    listProviderModel.taskList[index].toggle();
                    listProviderModel.deleteTask(index);
                  });
                }),
          );
        },
        padding: const EdgeInsets.only(
          left: 30,
          top: 20,
          right: 30,
        ),
      ),
    );
  }
}
