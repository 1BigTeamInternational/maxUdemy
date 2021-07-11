import 'package:flutter/material.dart';
import 'package:todoey/constant.dart';
import 'package:todoey/widgets/tasklist.dart';
import 'package:todoey/Screens/addtaskscreen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/controller/task_notifier.dart';

class ToDoeyScreen extends StatefulWidget {

  @override
  _ToDoeyScreenState createState() => _ToDoeyScreenState();
}

class _ToDoeyScreenState extends State<ToDoeyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            // Showing the BottomSheet without interacting with the existing screen
            // Goes to Add Task Screen
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
    
              // To have the AddTaskScreen sit just above the keyboard, you can wrap it inside
              // a SingleChildScrollView, which determines the padding at the bottom using a MediaQuery.
              builder: (context) => SingleChildScrollView(
                child: Container(
                  // The parts of the display that are completely obscured by system UI, typically
                  // by the device's keyboard. When a mobile device's keyboard is visible
                  // viewInsets.bottom corresponds to the top of the keyboard. Padding is
                  // calculated based on the viewPadding and viewInsets.
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(),
                ),
              ),
            ); // ShowModalBottomSheet
          },
        ),
        body: Column(
          //If you dont set the CrossAxisAlignment to start, it will always be in the center
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 100.0, left: 30.0, right: 15.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 50.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 40.0,
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    kAppName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    // Using the watch function we can access to the tasks
                    // and rebuilds the widget
                    '${context.watch<TaskNotifier>().tasks.length} tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
    );
  }
}
