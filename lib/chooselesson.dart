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
                  SizedBox(height: 16.0), // Added space before the title
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Chose a lesson',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(16.0),
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
                                  borderRadius: BorderRadius.circular(10),
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
    'Algebra',
    'Gain',
    'Geometry',
    'General',
    'Analysis',
    'Static',
    'Probability',
    'Other',
  ];

  List<String> customImages = [
    'images/algebra.png',
    'images/gain.png',
    'images/geometry.png',
    'images/general.png',
    'images/analysis.png',
    'images/statistic.png',
    'images/probability.png',
    'images/other.png',
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
                width: 150,
                height: 100, // Decreased height
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
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255,
                              0.5), // RGB values for white with opacity
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: 
                          Image.asset(
                            customImages[index],
                            width: 50,
                            height: 50,
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
