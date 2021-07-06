import 'package:flashchat/constant.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/components/inputtextbox.dart';
import 'package:flashchat/components/roundedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/logo.png',
                  width: kLogoWidth,
                  height: kLogoHeight,
                ),
              ),
            ),
            InputTextBox(
              hintText: 'Email',
              obscureText: false,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 8.0),
            InputTextBox(
              hintText: 'Password',
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 20.0),
            RoundedButton(
              text: 'Log In',
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushNamed(context, ChatScreen.id);
                } catch (e) {
                  print('error: $e');
                } //try-catch
                setState(() {
                  showSpinner = false;
                });
              },// onPressed
            ),
          ],
        ),
      ),
    );
  }
}
