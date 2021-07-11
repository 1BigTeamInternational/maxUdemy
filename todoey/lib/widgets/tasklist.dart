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
        return TaskTile(
          title: context.watch<TaskNotifier>().tasks[index].title,
          isChecked: context.watch<TaskNotifier>().tasks[index].isDone,
          onTap: () => context.read<TaskNotifier>().taskDone(index),
          onChanged: (checkBoxState) => context.read<TaskNotifier>().taskDone(index),
          onLongPressed: () => context.read<TaskNotifier>().deleteTask(index),
        );
      }, // itemBuilder
      itemCount: context.watch<TaskNotifier>().tasks.length,  // Sets the itemCount so that the ListView.builder knows how many items to build
    );
  }
}
