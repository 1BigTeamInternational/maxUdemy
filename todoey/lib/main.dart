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
        // _ just a subsitute for context which suppose to be pass in but no use hence use _
        // if there is a next argument that needs to put in, the next one would be __
        // third one would be ___ so on and so for.
        ChangeNotifierProvider(create: (_) => TaskNotifier()),
      ],
      child: MaterialApp(
        home: ToDoeyScreen(),
      ),
    );
  }
}
