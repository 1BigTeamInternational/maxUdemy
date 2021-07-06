import 'package:flashchat/components/roundedbutton.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/constant.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync:
          this, //With the SingleTickerProviderStateMixin, using this WelcomeScreenState object act as a ticker
    );

    //Creates an animation beginning color and changes to the end color
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    //Direction of the animation - forward
    controller.forward();

    //addlistener setStates whenever animation value changes
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose(); //destroying the controller once the screen is gone
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: kLogoTag,
                    child: Image.asset(
                      'images/logo.png',
                      height: 60.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        textStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: const Duration(milliseconds: 500),
                      ),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              ],
            ),
            RoundedButton(
              text: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.lightBlueAccent,
            ),
            RoundedButton(
              text: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
