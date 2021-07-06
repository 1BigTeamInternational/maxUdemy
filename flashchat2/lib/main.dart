import 'package:flashchat/Components/standardbutton.dart';
import 'package:flutter/material.dart';
//import 'package:flashchat/Screens/chat.dart';
//import 'package:flashchat/Screens/login.dart';
import 'package:flashchat/Screens/registration.dart';
import 'package:flashchat/constant.dart';

void main() {
  runApp(MaterialApp(
    routes: {
  //    Login.id: (context) => Login(),
  //    Chat.id: (context) => Chat(),
      Registration.id: (context) => Registration(),
    },
    home: FlashChatSetup(),
  ));
}

class FlashChatSetup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            StandardButton(
              onPressed: () {},
              text: 'FlashChat',
            ),
          ],
        ),
      ),
    );
  }
}