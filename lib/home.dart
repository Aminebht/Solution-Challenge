import 'package:app_0/ChooseSubject.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image covering 33% of the screen height
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sign_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.11,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Let's Get Started text
                  Text(
                    "Let's Get Started",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 0.04 * MediaQuery.of(context).size.height),

                  // Start button
                  SizedBox(
                    width: 0.73 * MediaQuery.of(context).size.width,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChooseSubject(),
                                ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF7B31F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  // Additional UI elements
                  SizedBox(height: 0.07 * MediaQuery.of(context).size.height),
                ],
              ),
            ),
          ),
          // Bottom background image covering 33% of the screen height
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/home_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
