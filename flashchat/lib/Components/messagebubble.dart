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
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          //create a greyish text stating the sender email with fontsize 12
          Text(
            this.sender,
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),

          //creates a message bubble using Material widget so that
          //we have full control of the widget itself
          Material(
            //checks for it text is from self
            //if its self, create a text bubble with rounded corner
            //using only() specifying top left, bottom left and right
            //if not, create a text bubble with rounded corner 
            //using only() specifying top right, bottom left and right
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            elevation: 5.0, //sets the elevation of the message bubble to be 5.0

            //Check self, change background color of message bubble to Light Blue Accent
            //if not, change background color of message bubble to yellow Accent [100]
            color: isMe ? Colors.lightBlueAccent : Colors.yellowAccent[100],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                this.text!,
                style: TextStyle(

                  //Check if it is self, change text color to white
                  //if not, change text color to black
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
