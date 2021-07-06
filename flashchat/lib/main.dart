import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  //initialising Firebase database
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FlashChatSetup());
}

class FlashChatSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //First Screen is Welcome Screen
      initialRoute: WelcomeScreen.id,

      //Setting up the routes to different Screens
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
