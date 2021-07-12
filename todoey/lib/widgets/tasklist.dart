import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasktile.dart';
import 'package:todoey/controller/task_notifier.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // The Listview.builder only builds the Listview to what can show on screen and not the whole list
    return ListView.builder(
      itemBuilder: (context, index) {
        // Watch is for reading properties
        // Read is for the functions
        final taskWatch = context.watch<TaskNotifier>();
        final taskRead = context.read<TaskNotifier>();

        return TaskTile(
          title: taskWatch.tasks[index].title,
          isChecked: taskWatch.tasks[index].isDone,
          onTap: () => taskRead.taskDone(index),
          onChanged: (checkBoxState) => taskRead.taskDone(index),
          onLongPressed: () => taskRead.deleteTask(index),
        );
      }, // itemBuilder
      itemCount: context.watch<TaskNotifier>().tasks.length,  // Sets the itemCount so that the ListView.builder knows how many items to build
    );
  }
}
