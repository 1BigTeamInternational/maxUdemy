import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Screens/todoeyscreen.dart';
import 'package:todoey/controller/task_notifier.dart';

void main() => runApp(TodoeySetup());

class TodoeySetup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskNotifier()),
      ],
      child: MaterialApp(
        home: ToDoeyScreen(),
      ),
    );
  }
}
