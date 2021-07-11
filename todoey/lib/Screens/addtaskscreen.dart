import 'package:flutter/material.dart';
import 'package:todoey/constant.dart';
import 'package:provider/provider.dart';
import 'package:todoey/controller/task_notifier.dart';

class AddTaskScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;

    return Container(
      decoration: BoxDecoration(
        color: Color(kGreyedBackGround),
      ),
      child: Container(
        decoration: kAddTaskScreenBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: kAddTaskHeaderTextStyle,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  focusedBorder: kAddTaskUnderlineInputBorder,
                  enabledBorder: kAddTaskUnderlineInputBorder,
                ),
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                ),
                onPressed: () {
                  context.read<TaskNotifier>().addTask(newTaskTitle);
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
