import 'package:EducationALL/Home.dart';
import 'package:EducationALL/chooseLesson.dart';
import 'package:flutter/material.dart';

class ChooseSubject extends StatefulWidget {
  @override
  _ChooseSubjectState createState() => _ChooseSubjectState();
}

class _ChooseSubjectState extends State<ChooseSubject> {
  int selectedChoice = -1; // Track the selected choice
  String selectedSubject = ''; // Variable to store the selected subject

  void showSubjectNotSelectedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Subject Not Selected'),
          content: const Text('Please select a subject before proceeding.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showUnavailableSubjectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Subject Unavailable'),
          content: const Text(
              'Sorry, lessons for this subject are not available at the moment.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7B31F4),Color(0xFFFEF6FF)],
            stops: [0.5, 0.5],
          ),
        ),
        child: SingleChildScrollView(
            
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Home(),
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
                      CircleIndicator(isPink: true),
                      SizedBox(width: 8.0),
                      CircleIndicator(),
                      SizedBox(width: 8.0),
                      CircleIndicator(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Choose a Subject',
                      style: TextStyle(
                        color: Color(0xFFFEF6FF),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF6FF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                        child:Column(
                        children: [
                          RadioSelectGrid(
                            customTexts: const [
                              'Math',
                              'Physics',
                              'Science',
                              'Chemistry',
                              'Robotics',
                              'Computer Science',
                              'History',
                              'Geography',
                            ],
                            onSelected: (index, selectedSubject) {
                              // Update the selected choice and subject
                              setState(() {
                                selectedChoice = index;
                                this.selectedSubject = selectedSubject;
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Check if a radio button is selected
                                if (selectedChoice != -1) {
                                  // Check if the selected subject is "Math"
                                  if (selectedSubject.toLowerCase() == 'math') {
                                    // Print or use the selected subject as needed
                                    print('Selected Subject: $selectedSubject');
      
                                    // Navigate to ChooseLesson when a button is pressed
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ChooseLesson(),
                                      ),
                                    );
                                  } else {
                                    // Show a message or perform some action when the subject is not "Math"
                                    showUnavailableSubjectDialog();
                                  }
                                } else {
                                  // Show a message or perform some action when no radio button is selected
                                  showSubjectNotSelectedDialog();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFFEF6FF),
                                backgroundColor: const Color(0xFF843AFD),
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
    );
  }
}

class RadioSelectGrid extends StatefulWidget {
  final List<String> customTexts;
  final Function(int, String) onSelected;

  const RadioSelectGrid({
    Key? key,
    required this.customTexts,
    required this.onSelected,
  }) : super(key: key);

  @override
  _RadioSelectGridState createState() => _RadioSelectGridState();
}

class _RadioSelectGridState extends State<RadioSelectGrid> {
  int selectedChoice = -1;

  List<String> explicitImageNames = [
    'math.png',
    'physics.png',
    'science.png',
    'chemistry.png',
    'robotics.png',
    'lap.png',
    'history.png',
    'geography.png',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04;

    return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25.0,
              crossAxisSpacing: 25.0,
              childAspectRatio: 1.20,
            ),
            itemCount: widget.customTexts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedChoice = index;
                    widget.onSelected(
                        index,
                        widget.customTexts[
                            index]); // Notify the parent about the selection
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedChoice == index
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
                              'images/${explicitImageNames[index]}',
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.customTexts[index],
                          style: TextStyle(
                            color: selectedChoice == index
                                ? const Color(0xFFFEF6FF)
                                : const Color.fromRGBO(123, 49, 244, 1.0),
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
          );
   
  }
}
