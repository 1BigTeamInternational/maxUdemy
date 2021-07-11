import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoey/model/task.dart';

class TaskNotifier extends ChangeNotifier {
    List <Task> _tasks = [
    Task(title:'Buy milk'),
    Task(title:'Buy eggs'),
    Task(title: 'Shopping'),
  ];
  
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(index) {
    // Remove where the title is equal to the one on the list
    _tasks.removeWhere((_task) => _task.title == _tasks[index].title);
    notifyListeners();
  }

  void taskDone(index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}