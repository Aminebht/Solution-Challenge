// ignore_for_file: file_names

import 'package:EducationALL/Home.dart';
import 'package:flutter/material.dart';

class DoneOneQuestion extends StatelessWidget {
  final String selectedLesson;
  final int uprate;
  final int totalQuizDone;

  const DoneOneQuestion({super.key, 
    required this.selectedLesson,
    required this.uprate,
    required this.totalQuizDone,
  });

  @override
  Widget build(BuildContext context) {
    String chaine;
    int score = uprate;

    score >= 0 ? chaine = 'Increased' : chaine = 'Decreased';

    return Scaffold(
      backgroundColor: const Color(0xFFFEF6FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  score >= 0 ? 'Good Job!' : 'Not Bad!',
                  style: const TextStyle(
                    color: Color(0xFF1F1926),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  height: 0.5 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF78AB1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        score >= 0 ? 'images/good.png' : 'images/not_bad.png',
                        height: 173.6,
                        width: 150,
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 290,
                        child: Text(
                          'Your Score in "$selectedLesson" $chaine with ${score.abs()}%',
                          style: const TextStyle(
                            color: Color(0xFFFEF6FF),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'You Did +$totalQuizDone Quiz',
                  style: const TextStyle(
                    color: Color(0xFF1F1926),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        /*if (totalQuizDone % 30 == 0) {
                                // Show the feedback popup*/
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const FeedbackPopup();
                          },
                        );
                        /*} else {
                                // Navigate to Home page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              }*/
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B31F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Container(
                        width: 0.8 * MediaQuery.of(context).size.width,
                        height: 60,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Color(0xFFFEF6FF),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
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
    );
  }

}

class FeedbackPopup extends StatefulWidget {
  const FeedbackPopup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackPopupState createState() => _FeedbackPopupState();
}

class _FeedbackPopupState extends State<FeedbackPopup> {
  double difficultyValue = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('How was the difficulty?', style: TextStyle(fontSize: 18)),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Slider(
                  value: difficultyValue,
                  min: -1,
                  max: 1,
                  divisions: 4,
                  onChanged: (value) {
                    setState(() {
                      difficultyValue = value;
                    });
                  },
                  activeColor: const Color(0xFF7B31F4),
                  label: difficultyValue.toString(),
                ),
                const Positioned(
                  top: 35,
                  left: 12,
                  child: Text('Easy',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                const Positioned(
                  top: 35,
                  left: 122,
                  child: Text('Suits Me',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                const Positioned(
                  top: 35,
                  right: 0,
                  child: Text('Very Hard',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF7B31F4),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('Submit',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0),
      ),
    );
  }
}
