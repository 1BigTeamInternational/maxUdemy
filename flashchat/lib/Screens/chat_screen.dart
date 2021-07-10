import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashchat/components/messagebubble.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;
late String typedMessage;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final msgTextController = TextEditingController();  //creates a controller for the InputBox
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    loggedInUser = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('⚡ Flash Chat'),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgTextController,
                      decoration: kMessageTextFieldDecoration,
                      onChanged: (value) {
                        typedMessage = value;
                      },
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Send',
                    ),
                    onPressed: () {
                      msgTextController.clear();  //clear the TextField once press send`
                      _firestore.collection(kDatabaseName).add({
                        kText: typedMessage,
                        kSender: loggedInUser?.email,
                        kTimeStamp: DateTime.now(),
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder <QuerySnapshot> (
      
      //Getting Stream from firebase ordered based on Timestamp field
      //where the latest timestamp will be shown last
      stream: _firestore.collection(kDatabaseName).orderBy(kTimeStamp, descending: false).snapshots(),
      builder: (context,snapshot) {

        //Checks if database is ready to be read,
        //if not, shows a circular progress indicator
        if(!snapshot.hasData) {
          return Container (
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          );
        } //if

        List <MessageBubble> messageBubbles = []; //create a List of Message Bubble
        final messages = snapshot.data?.docs.reversed; //get the data stream from database in a reversed order

        //checks for no data stream
        if (messages != null) {

          //using the for loop to loop through all the messages using msg as the index
          for (var msg in messages) {
            final msgText = msg.get(kText);
            final msgSender = msg.get(kSender);
            final messageBubble = MessageBubble(
              sender: msgSender,
              text: msgText,
              isMe: msgSender == loggedInUser?.email, //Checks for if the sender is self, returns true, else false
            );

            messageBubbles.add(messageBubble);  //adds the message bubble to the list
          } // for-loop
        } // if

        //Using expanded so that it can take up all the space
        return Expanded(
          // Creates a ListView (comes with scroll function)
          child: ListView(
            reverse: true,  //reverse makes the ListView sticky to the end view
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          )
        );
      } // builder
    );
  }
}