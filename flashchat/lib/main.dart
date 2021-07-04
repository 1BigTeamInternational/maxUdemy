import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/Screens/chat.dart';
import 'package:flashchat/Screens/login.dart';
import 'package:flashchat/Screens/registration.dart';
import 'package:flashchat/Screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChatSetup());
}

class FlashChatSetup extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat(),
        Registration.id: (context) => Registration(),
      },
    );
  }
}
