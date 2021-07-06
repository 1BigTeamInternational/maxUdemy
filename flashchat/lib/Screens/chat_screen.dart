import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
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
                      decoration: kMessageTextFieldDecoration,
                      onChanged: (value) {},
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Send',
                    ),
                    onPressed: () {},
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
      //where teh latest timestamp will be shown last
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
        
      }
    );
  }
}