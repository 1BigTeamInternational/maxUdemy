import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.isMe, this.text});

  final String sender;
  final String? text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(

        //Checking for if the text is from self
        //if true, place the text bubble on the right side (end)
        //if it is other sender, place the text bubble on the left side (start)
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget> [

          //create a greyish text stating the sender email with fontsize 12
          Text(
            this.sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54
            ),
          ),

          //creates a message bubble using Material widget so that
          //we have full control of the widget itself
          Material(
            
            borderRadius: isMe ? BorderRadius.only(),
          ),
        ],
      ),
    );
  }
}