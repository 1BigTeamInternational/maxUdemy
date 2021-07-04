import 'package:flutter/material.dart';
import 'package:destini/storybrain.dart';

void main() => runApp(DestiniSetup());

class DestiniSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: DestiniApp(),
        ),
      ),
    );
  }
}

class DestiniApp extends StatefulWidget {
  @override
  _DestiniAppState createState() => _DestiniAppState();
}

class _DestiniAppState extends State<DestiniApp> {
  StoryBrain myStoryBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  myStoryBrain.getStory(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    myStoryBrain.nextStory(choice: 1);
                  });
                },
                child: Container(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      myStoryBrain.getChoice1(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Visibility(
                visible: !myStoryBrain.isEndOfStory(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      myStoryBrain.nextStory(choice: 2);
                    });
                  },
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        myStoryBrain.getChoice2(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
