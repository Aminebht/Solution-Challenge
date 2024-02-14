import 'package:EducationALL/ChooseForm.dart';
import 'package:EducationALL/ChooseSubject.dart';
import 'package:EducationALL/SignIn.dart';
import 'package:EducationALL/my_data.dart';
import 'package:EducationALL/questions.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChooseLesson extends StatefulWidget {
  @override
  _ChooseLessonState createState() => _ChooseLessonState();
}

class _ChooseLessonState extends State<ChooseLesson> {
  int selectedChoice = -1;
  List<String> lessons = [
    'algebra',
    'gain',
    'geometry',
    'general',
    'physics',
    'static',
    'probability',
    'other',
  ];

  void updateSelectedChoice(int choice) {
    setState(() {
      selectedChoice = choice;
    });
  }

  void showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignIn(),
                ));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF843AFD),
                Colors.white
              ], // Purple to white gradient
              stops: [
                0.5,
                0.5
              ], // Adjust the position where the colors transition
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40.0),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/back.png',
                            width: 24.0,
                            height: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleIndicator(),
                      SizedBox(width: 8.0),
                      CircleIndicator(isPink: true),
                      SizedBox(width: 8.0),
                      CircleIndicator(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Choose a Lesson',
                      style: TextStyle(
                        color: Color(0xFFFEF6FF),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFEF6FF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          RadioSelectGrid(
                            selectedChoice: selectedChoice,
                            updateSelectedChoice: updateSelectedChoice,
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  if (selectedChoice == -1) {
                                    // Show popup for not selecting a lesson
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Select a Lesson"),
                                          content: const Text(
                                              "Please select a lesson before proceeding."),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("OK"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else if (selectedChoice == 0 ||
                                      selectedChoice == 5) {
                                    // Show popup for lesson not available
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              "Lesson Not Available"),
                                          content: const Text(
                                              "The selected lesson is not available."),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("OK"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    // Navigate to the next screen as the lesson is valid
                                    var box = await Hive.openBox('testBox');
                                    if (box.isNotEmpty) {
                                      MyData? userData = box.values.last;
                                      if (userData != null &&
                                          userData.userScores != null) {
                                        int? selectedChoiceScore =
                                            userData.userScores[
                                                lessons[selectedChoice]];
                                        if (selectedChoiceScore != null &&
                                            selectedChoiceScore == 0) {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => Questions(
                                                selectedChoice: selectedChoice,
                                                lnew: 1),
                                          ));
                                        } else {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => ChooseForm(
                                                selectedChoice: selectedChoice),
                                          ));
                                        }
                                      } else {
                                        print(
                                            "Error: User data or user scores are null");
                                      }
                                    } else {
                                      print("Error: Hive box is empty");
                                      showErrorDialog(
                                        context,
                                        'Error',
                                        'User not Signed In correctly..\nPlease Sign In again',
                                      );
                                    }
                                  }
                                } catch (e) {
                                  print("Error: $e");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Color(0xFFFEF6FF),
                                backgroundColor:
                                    const Color.fromRGBO(123, 49, 244, 1.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 24.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
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

  RadioSelectGrid(
      {required this.selectedChoice, required this.updateSelectedChoice});

  @override
  _RadioSelectGridState createState() => _RadioSelectGridState();
}

class _RadioSelectGridState extends State<RadioSelectGrid> {
  List<String> customTexts = [
    'Algebra',
    'Gain',
    'Geometry',
    'General',
    'Physics',
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
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      ? const Color.fromRGBO(247, 138, 177, 1.0)
                      : const Color.fromRGBO(229, 212, 255, 1.0),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 0.17 * screenWidth,
                        height: 0.17 * screenWidth,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.5),
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
                      const SizedBox(height: 4.0),
                      Text(
                        customTexts[index],
                        style: TextStyle(
                          color: widget.selectedChoice == index
                              ? Color(0xFFFEF6FF)
                              : const Color(0xFF843AFD),
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
            ? const Color.fromRGBO(247, 138, 177, 1.0)
            : Color(0xFFFEF6FF),
      ),
    );
  }
}
