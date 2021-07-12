import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoey/model/task.dart';

class TaskNotifier extends ChangeNotifier {
    List <Task> _tasks = [
    Task(title:'Buy milk'),
    Task(title:'Buy eggs'),
    Task(title: 'Shopping'),
  ];
  
  // UnmodifiableListView is a List to view other list e.g. window to look at the list
  // Makes the tasks to be unmodifiable 
  // So whenever accessing tasks you are just reading it not changing it
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String title) {
    final Task task = Task(title: title);

    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(index) {
    // Remove the Task object from the List
    _tasks.remove(_tasks[index]);
    notifyListeners();
  }

  void taskDone(index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}