// Data model classes
import 'package:flutter/material.dart';

class Lesson {
  final String name;

  Lesson({required this.name});
}

class Subject {
  final String name;
  final List<Lesson> lessons;

  Subject({required this.name, required this.lessons});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(
        child: Stats(),
      ),
    );
  }
}

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int selectedBoxIndex = -1; // -1 represents no selection

  // Data
  List<Subject> subjects = [
    Subject(name: 'Math', lessons: [
      Lesson(name: 'Algebra'),
      Lesson(name: 'Gain'),
      Lesson(name: 'Geometry'),
      Lesson(name: 'General'),
      Lesson(name: 'Analysis'),
      Lesson(name: 'Statistic'),
      Lesson(name: 'Probability'),
      Lesson(name: 'Other'),
    ]),
    Subject(name: 'Physics', lessons: [
      // Add lessons for Physics
    ]),
    Subject(name: 'Science', lessons: [
      // Add lessons for Science
    ]),
    Subject(name: 'Chemistry', lessons: [
      // Add lessons for Chemistry
    ]),
    Subject(name: 'Robotics', lessons: [
      // Add lessons for Robotics
    ]),
    Subject(name: 'Computer\nScience', lessons: [
      // Add lessons for Computer Science
    ]),
    Subject(name: 'History', lessons: [
      // Add lessons for History
    ]),
    Subject(name: 'Geography', lessons: [
      // Add lessons for Geography
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7B31F4),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 0.92 * MediaQuery.of(context).size.width,
              height: 1100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center elements horizontally
                children: [
                  const SizedBox(height: 50),
                  Positioned(
                    top: 50,
                    left: (MediaQuery.of(context).size.width - 140) / 2,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/cup.png'),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 0.84 * MediaQuery.of(context).size.width,
                        height: 400 / 2,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5D4FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            const Text(
                              'SELECT A SUBJECT',
                              style: TextStyle(
                                color: Color(0xFF572CB2),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                4,
                                (index) => buildSelectableBox(
                                  index,
                                  width: 0.84 * MediaQuery.of(context).size.width,
                                  height: 400 / 2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                4,
                                (index) => buildSelectableBox(
                                  index + 4,
                                  width: 0.84 * MediaQuery.of(context).size.width,
                                  height: 400 / 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 0.84 * MediaQuery.of(context).size.width,
                    height: 596,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B31F4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'YOUR LEVEL BY LESSON',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  height: 489,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            buildDashedIndicator('0%'),
                                            buildDashedIndicator('25%'),
                                            buildDashedIndicator('50%'),
                                            buildDashedIndicator('75%'),
                                            buildDashedIndicator('100%'),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        bottom: 60,
                                        left: 0,
                                        right: 0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: List.generate(
                                            8,
                                            (index) => Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Row(
                                                   
                                                    children: [
                                                      Row(
                                                        
                                                        children :[
                                                      Container(
                                                        width: 6,
                                                        height: 6,
                                                        decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        'Lesson ${index + 1}',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      ],
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Container(
                                                        width: (3.8 / 5) * (0.84 * MediaQuery.of(context).size.width),
                                                        height: 27,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),



                       
                        ],
                      ),
                    ),
                     
                  ),
                  // Dashed Indicators below all rows
                 
                ],
              ),

              // Add another Container after the Select a Subject container
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSelectableBox(int index, {required double width, required double height}) {
    double boxWidth = width * 0.2; // Adjusted width based on the container's dimensions
    double boxHeight = height * 0.25; // Adjusted height based on the container's dimensions

    return GestureDetector(
      onTap: () {
        // Handle the tap event here, update the selected box
        setState(() {
          if (selectedBoxIndex == index) {
            // If the same box is tapped, unselect it
            selectedBoxIndex = -1;
          } else {
            // Otherwise, select the new box
            selectedBoxIndex = index;
          }
        });
      },
      child: Container(
        width: boxWidth,
        height: boxHeight,
        decoration: BoxDecoration(
          color: selectedBoxIndex == index ? const Color(0xFFF78AB1) : Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            subjects[index].name,
            style: TextStyle(
              color: selectedBoxIndex == index ? Colors.white : const Color(0xFF7B31F4),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDashedIndicator(String label) {
  return Column(
    children: [
      SizedBox(
        width: 1,
        height: 440,
        child: Column(
          children: List.generate(
           70, // Adjust the number of dashes as needed
            (index) => Container(
              width: 1,
              height: 2, // Adjust the height of each dash
              margin: const EdgeInsets.symmetric(vertical: 2), // Adjust the spacing between dashes
              color: Colors.white,
            ),
          ),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

}
