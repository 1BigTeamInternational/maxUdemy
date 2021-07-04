import 'package:flutter/material.dart';

void main() {
  runApp(MiCard());
}

class MiCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/maxtay.jpg')
                ),

                SizedBox(height: 10.0),

                Text(
                  'Max Tay',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Xoxoglow',
                    color: Colors.white,
                  ),
                ),

                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'sourcesanspro',
                    color: Colors.white,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                    title: Text(
                        '+65 91234567',
                        style: TextStyle(
                          fontFamily: 'sourcesanspro',
                          color: Colors.teal[900],
                          fontSize: 20.0,
                        ),
                      ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                        Icons.email,
                        color: Colors.teal[900],
                      ),
                    title: Text(
                        'max@email.com',
                        style: TextStyle(
                          fontFamily: 'sourcesanspro',
                          color: Colors.teal[900],
                          fontSize: 20.0, 
                        ),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}