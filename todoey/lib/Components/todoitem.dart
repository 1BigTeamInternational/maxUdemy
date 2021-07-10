import 'package:flutter/material.dart';

class ToDoItem extends StatefulWidget {
  ToDoItem({required this.item});

  final String item;

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool _checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: Row(
        children: <Widget> [
          Expanded(
            child: Text(
              this.widget.item,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Checkbox(
            value: _checkBox, 
            onChanged: (value) {
              setState(() {
                //! gives back the opposite of existing value,
                //if original value is true, it will set it to false. vici versa
                _checkBox = !_checkBox;
              });
            },
          ),
        ],
      ),
    );
  }
}