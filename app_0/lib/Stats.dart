// ignore_for_file: file_names

import 'package:EducationALL/home.dart';
import 'package:EducationALL/my_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Lesson {
  final String name;

  Lesson({required this.name});
}

class Subject {
  final String name;
  final List<Lesson> lessons;

  Subject({required this.name, required this.lessons});
}

class Stats extends StatefulWidget {
  final String url;
  final String name;
  const Stats({required this.url, required this.name, Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int selectedBoxIndex = 0;
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
    ]),
    Subject(name: 'Science', lessons: []),
    Subject(name: 'Chemistry', lessons: []),
    Subject(name: 'Robotics', lessons: []),
    Subject(name: 'Computer\nScience', lessons: []),
    Subject(name: 'History', lessons: []),
    Subject(name: 'Geography', lessons: []),
  ];

  List<int> transformValuesToList(Map<String, dynamic> inputMap) {
    List<int> resultList = [];
    resultList.add(0);
    for (int i = 1; i <= 4; i++) {
      if (i <= inputMap.length) {
        resultList.add(inputMap.values.elementAt(i - 1) as int);
      } else {
        resultList.add(0);
      }
    }
    resultList.add(0);
    for (int i = 4; i < 6; i++) {
      resultList.add(inputMap.values.elementAt(i) as int);
    }
    return resultList;
  }

  Future<List<int>> getscores() async {
    List<int> intList = [0, 0, 0, 0, 0, 0, 0, 0];
    try {
      var box = await Hive.openBox('testBox');
      if (box.isNotEmpty) {
        MyData? userData = box.values.last;
        Map<String, dynamic> userscores = userData!.userScores;
        intList = transformValuesToList(userscores);
        return intList;
      }
      await box.close();
      return intList;
    } catch (e) {
      return intList;
    }
  }

  List<int> scores = [0, 0, 0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    loadScores();
  }

  Future<void> loadScores() async {
    scores = await getscores();
    setState(() {});
  }

  List<Color> rectangleColors = [
    const Color.fromARGB(255, 254, 251, 100),
    const Color(0xFFA2E3D7),
    const Color(0xFFE994FF),
    const Color(0xFFFFD6DD),
    const Color(0xFFC4D0FB),
    const Color(0xFFE4958A),
    const Color(0xFFFFF8E8),
    const Color(0xFFBAA1D5),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    bool isMath = selectedBoxIndex ==
        0;

    String name1 = widget.name;
    return Scaffold(
      backgroundColor: const Color(0xFF843AFD),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
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
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      Positioned(
                        top: 50,
                        left: (MediaQuery.of(context).size.width - 140) / 2,
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFFFEF6FF),
                          backgroundImage: AssetImage('images/sss.png'),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            name1,
                            style: const TextStyle(
                              color: Color(0xFF1F1926),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: 0.9 * MediaQuery.of(context).size.width,
                            height: 200,
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
                                    color: Color(0xFF843AFD),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    4,
                                    (index) => buildSelectableBox(
                                      index,
                                      width: 0.84 *
                                          MediaQuery.of(context).size.width,
                                      height: 400 / 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    4,
                                    (index) => buildSelectableBox(
                                      index + 4,
                                      width: 0.84 *
                                          MediaQuery.of(context).size.width,
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
                      if (isMath)
                        Container(
                          padding: const EdgeInsets.all(30),
                          width: 0.9 * MediaQuery.of(context).size.width,
                          height: 596,
                          decoration: BoxDecoration(
                            color: const Color(0xFF843AFD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 30,
                                ),
                                // child: Text(
                                //   'YOUR LEVEL BY LESSON',
                                //   style: TextStyle(
                                //     color: Color(0xFFFEF6FF),
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildDashedIndicator('0%'),
                                    buildDashedIndicator('25%'),
                                    buildDashedIndicator('50%'),
                                    buildDashedIndicator('75%'),
                                    buildDashedIndicator('100%'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 489,
                                child: Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                          8,
                                          (index) => Expanded(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 6,
                                                    height: 6,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xFFFEF6FF),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    subjects[0].lessons[index].name,
                                                    style: const TextStyle(
                                                      color: Color(0xFFFEF6FF),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                          8,
                                          (index) => Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: (3.3 / 5) *
                                                      (0.84 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width) *
                                                      scores[index] /
                                                      100,
                                                  height: 27,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        rectangleColors[index],
                                                  ),
                                                ),
                                              ],
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
                        )
                      else
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Statistics for this subject are not available yet.',
                            style: TextStyle(
                              color: Color(0xFF843AFD),
                              fontSize: 16,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectableBox(int index,
      {required double width, required double height}) {
    double boxWidth = width * 0.2;

    double boxHeight = height * 0.25;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedBoxIndex == index) {
            selectedBoxIndex = -1;
          } else {
            selectedBoxIndex = index;
          }
        });
      },
      child: Container(
        width: boxWidth,
        height: boxHeight,
        decoration: BoxDecoration(
          color: selectedBoxIndex == index
              ? const Color(0xFFF78AB1)
              : const Color(0xFFFEF6FF).withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            subjects[index].name,
            style: TextStyle(
              color: selectedBoxIndex == index
                  ? const Color(0xFFFEF6FF)
                  : const Color(0xFF843AFD),
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
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: SizedBox(
            width: 1,
            height: 440,
            child: Column(
              children: List.generate(
                70,
                (index) => Container(
                  width: 1,
                  height: 2,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  color: const Color(0xFFFEF6FF),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFFEF6FF),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
