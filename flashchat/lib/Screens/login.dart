import 'package:flashchat/Components/constant.dart';
import 'package:flashchat/Components/standardbutton.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/Components/inputbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/Screens/chat.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/logo.png',
                width: kLogoWidth,
                height: kLogoHeight,
              ),
            ),
            InputBox(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              onChanged: (value) {
                email = value;
              },
            ),
            InputBox(
              hintText: 'Password',
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 30.0),
            StandardButton(
              text: 'Login',
              onPressed: () async{
                setState(() {
                  showSpinner = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushNamed(context, Chat.id);
                } catch (e) {
                  print(e);
                }
                setState(() {
                  showSpinner = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
