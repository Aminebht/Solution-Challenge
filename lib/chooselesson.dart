import 'package:app_0/ChooseForm.dart';
import 'package:app_0/ChooseSubject.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose Lesson',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChooseLesson(),
    );
  }
}

class ChooseLesson extends StatefulWidget {
  @override
  _ChooseLessonState createState() => _ChooseLessonState();
}

class _ChooseLessonState extends State<ChooseLesson> {
  int selectedChoice = -1;

  void updateSelectedChoice(int choice) {
    setState(() {
      selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(123, 49, 244, 1.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0),
                   Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChooseSubject(),
                                ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                       
                        child: Image.asset(
                          'images/back.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleIndicator(),
                      SizedBox(width: 8.0),
                      CircleIndicator(isPink: true),
                      SizedBox(width: 8.0),
                      CircleIndicator(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Choose a Lesson',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
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
                            selectedChoice: selectedChoice,
                            updateSelectedChoice: updateSelectedChoice,
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (selectedChoice != -1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ChooseForm(),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please select a lesson before proceeding.'),
                                    ),
                                  );
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
      ),
    );
  }
}

class RadioSelectGrid extends StatefulWidget {
  final int selectedChoice;
  final Function(int) updateSelectedChoice;

  RadioSelectGrid({required this.selectedChoice, required this.updateSelectedChoice});

  @override
  _RadioSelectGridState createState() => _RadioSelectGridState();
}

class _RadioSelectGridState extends State<RadioSelectGrid> {
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
                widget.updateSelectedChoice(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.selectedChoice == index
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
                          color: widget.selectedChoice == index
                              ? Colors.white
                              : Color.fromRGBO(123, 49, 244, 1.0),
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
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
            ? Color.fromRGBO(247, 138, 177, 1.0)
            : Colors.white,
      ),
    );
  }
}
