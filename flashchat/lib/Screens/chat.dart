import 'package:flashchat/Components/constant.dart';
import 'package:flashchat/Components/messagebubble.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;
bool firstTime = true;

class Chat extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String typedMessage;

  void getCurrentUser() async {
    final user = _auth.currentUser;

    loggedInUser = user;
  }

  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('⚡ Chat'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
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
                  //Using Expanded so that the widgets can take up the whole row
                  //with the InputBox taking a majority
                  Expanded(
                    flex: 6,
                    child: TextField(
                      controller: messageTextController,
                      decoration: kMessageTextFieldDecoration,
                      onChanged: (value) {
                        typedMessage = value;
                      },
                    ),
                  ),

                  Expanded(
                    child: TextButton(
                      child: Text('Send'),
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection(kDatabaseName).add({
                          kText: typedMessage,
                          kSender: loggedInUser?.email,
                          kTimeStamp: DateTime.now(),
                        });
                      },
                    ),
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
    return StreamBuilder<QuerySnapshot>(
      //Getting the stream from firebase ordered by Timestamp field
      //where the latest timestamp will be shown last
      stream: _firestore.collection(kDatabaseName).orderBy(kTimeStamp,descending: false).snapshots(),
      builder: (context, snapshot) {
        //Checks if the database is ready to be read,
        //if not, show a circular progress indicator
        if (!snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          );
        }
        List<MessageBubble> messsageBubbles = [];
        final messages = snapshot.data?.docs.reversed;

        //get the list of data from the database
        //checks for null
        //get the right field to display
        if (messages != null) {
          for (var msg in messages) {
            final msgText = msg.get(kText);
            final msgSender = msg.get(kSender);
            final msgBubble = MessageBubble(
              sender: msgSender, 
              text: msgText,
              isMe: msgSender == loggedInUser?.email,
            );
            messsageBubbles.add(msgBubble);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,  //reverse makes the ListView sticky to the end view
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messsageBubbles,
          ),
        );
      },
    );
  }
}
