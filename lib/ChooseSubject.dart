import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(123, 49, 244, 1.0), // RGB values for purple
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0,
                  ), // Added more space above the three dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleIndicator(isPink: true),
                      SizedBox(width: 8.0),
                      CircleIndicator(),
                      SizedBox(width: 8.0),
                      CircleIndicator(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Choose a Subject',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Increased border radius
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          RadioSelectGrid(),
                          SizedBox(height: 16.0),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle 'Next' button press
                                print('Next button pressed');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(
                                    123, 49, 244, 1.0), // RGB values for purple
                                onPrimary: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 24.0, // Increased height
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 18.0, // Increased font size
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioSelectGrid extends StatefulWidget {
  @override
  _RadioSelectGridState createState() => _RadioSelectGridState();
}

class _RadioSelectGridState extends State<RadioSelectGrid> {
  int selectedChoice = -1;

  List<String> customTexts = [
    'Math',
    'Physics',
    'Science',
    'Chemistry',
    'Robotics',
    'Computer \nScience',
    'History',
    'Geography',
  ];

  List<String> customImages = [
    'images/algebra.png',
    'images/algebra.png',
    'images/algebra.png',
    'images/algebra.png',
    'images/algebra.png',
    'images/algebra.png',
    'images/algebra.png',
    'images/algebra.png',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04; // Adjust the multiplier as needed

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 25.0, // Decreased mainAxisSpacing
            crossAxisSpacing: 25.0, // Decreased crossAxisSpacing
            childAspectRatio: 1.20, // Adjust the aspect ratio
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedChoice = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedChoice == index
                      ? Color.fromRGBO(
                          247, 138, 177, 1.0) // RGB values for deep pink
                      : Color.fromRGBO(
                          229, 212, 255, 1.0), // RGB values for blue
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75, // Increased width
                        height: 75, // Increased height
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255,
                              0.5), // RGB values for white with opacity
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Image.asset(
                            customImages[index],
                            width: 70, // Increased width
                            height: 70, // Increased height
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 4.0), // Reduced space between image and text
                      Text(
                        customTexts[index],
                        style: TextStyle(
                          color: selectedChoice == index
                              ? Colors.white
                              : Color.fromRGBO(
                                  123, 49, 244, 1.0), // RGB values for purple
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold, // Added fontWeight
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CircleIndicator extends StatelessWidget {
  final bool isPink;

  const CircleIndicator({Key? key, this.isPink = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isPink
            ? Color.fromRGBO(247, 138, 177, 1.0) // RGB values for deep pink
            : Colors.white,
      ),
    );
  }
}
