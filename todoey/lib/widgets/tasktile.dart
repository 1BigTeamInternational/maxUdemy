import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({required this.title, required this.isChecked, this.onChanged, this.onLongPressed, this.onTap});

  final String title;
  final bool isChecked;
  final VoidCallback? onTap;
  final Function(bool?)? onChanged;
  final VoidCallback? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 20.0, 0.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text(
                this.title,
                style: TextStyle(
                  // Checks is it is done, if done, change the TextDecoration to lineThrough
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),

              //onTap checks the checkbox too
              onTap: this.onTap,
              onLongPress: this.onLongPressed,
              trailing: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: this.isChecked,
                onChanged: this.onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToDoText extends StatelessWidget {
  ToDoText({required this.text, required this.textStyle});

  final String text;
  final TextDecoration textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: 20.0,
        decoration: this.textStyle,
      ),
    );
  }
}
