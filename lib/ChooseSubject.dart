import 'package:app_0/chooselesson.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose Subject',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChooseSubject(),
    );
  }
}
class ChooseSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int selectedChoice = -1; // Track the selected choice

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(123, 49, 244, 1.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.0,
                ),
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        RadioSelectGrid(
                          onSelected: (index) {
                            // Update the selected choice
                            selectedChoice = index;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Check if a radio button is selected
                              if (selectedChoice != -1) {
                                // Navigate to ChooseLesson when a button is pressed
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ChooseLesson(),
                                  ),
                                );
                              } else {
                                // Show a message or perform some action when no radio button is selected
                                print('Please select a subject');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(123, 49, 244, 1.0),
                              onPrimary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 24.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 18.0,
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
    );
  }
}

class RadioSelectGrid extends StatefulWidget {
  final Function(int) onSelected;

  const RadioSelectGrid({Key? key, required this.onSelected}) : super(key: key);

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
    'images/math.png',
    'images/physics.png',
    'images/science.png',
    'images/chemistry.png',
    'images/robotics.png',
    'images/lap.png',
    'images/history.png',
    'images/geography.png',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04;

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 25.0,
            crossAxisSpacing: 25.0,
            childAspectRatio: 1.20,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedChoice = index;
                  widget.onSelected(selectedChoice); // Notify the parent about the selection
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedChoice == index
                      ? Color.fromRGBO(247, 138, 177, 1.0)
                      : Color.fromRGBO(229, 212, 255, 1.0),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Image.asset(
                            customImages[index],
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        customTexts[index],
                        style: TextStyle(
                          color: selectedChoice == index
                              ? Colors.white
                              : Color.fromRGBO(123, 49, 244, 1.0),
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
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
