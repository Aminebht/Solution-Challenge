import 'package:EducationALL/Home.dart';
import 'package:flutter/material.dart';

class DoneQuestions extends StatelessWidget {
  final int numberOfCorrectAnswers;
  final int numberOfTimeOut;
  final int numberOfIncorrectAnswers;
  final String selectedLesson;
  final int totalQuizDone;
  final int uprate;
  final int lnew;
  DoneQuestions({
    required this.numberOfCorrectAnswers,
    required this.numberOfTimeOut,
    required this.numberOfIncorrectAnswers,
    required this.selectedLesson,
    required this.totalQuizDone,
    required this.uprate,
    required this.lnew,
  });

  @override
  Widget build(BuildContext context) {
    double accuracy = (numberOfCorrectAnswers / 6 * 100).truncateToDouble();
    String chaine;
    int score = uprate;
    lnew == 1
        ? chaine = 'is Set to'
        : accuracy >= 50
            ? chaine = 'Increased with'
            : chaine = 'decreased with';

    return Scaffold(
      backgroundColor: const Color(0xFFFEF6FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  accuracy >= 50 ? 'Good Job!' : 'Not Bad!',
                  style: const TextStyle(
                    color: Color(0xFF1F1926),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  height: 0.5 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(0xFFF78AB1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        lnew == 1
                            ? 'images/good.png'
                            : accuracy >= 50
                                ? 'images/good.png'
                                : 'images/not_bad.png',
                        height: 173.6,
                        width: 150,
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: 290,
                        child: Text(
                          'Your Score in "$selectedLesson" $chaine $score%',
                          style: TextStyle(
                            color: Color(0xFFFEF6FF),
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'You Did +$totalQuizDone Quiz',
                  style: TextStyle(
                    color: Color(0xFF1F1926),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center horizontally
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoElement(
                            'CORRECT ANSWER', '$numberOfCorrectAnswers'),
                        SizedBox(width: 60),
                        _buildInfoElement('ACCURACY', '$accuracy%'),
                        SizedBox(width: 55),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center horizontally
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoElement('TIMER OUT', '$numberOfTimeOut'),
                        SizedBox(width: 100),
                        _buildInfoElement(
                            'INCORRECT ANSWER', '$numberOfIncorrectAnswers'),
                      ],
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        /*if (totalQuizDone % 30 == 0) {
                                // Show the feedback popup*/
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FeedbackPopup();
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
                        backgroundColor: Color(0xFF7B31F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Container(
                        width: 0.8 * MediaQuery.of(context).size.width,
                        height: 60,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
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

  Widget _buildInfoElement(String title, String value) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF979797),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: Color(0xFF1F1926),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

class FeedbackPopup extends StatefulWidget {
  @override
  _FeedbackPopupState createState() => _FeedbackPopupState();
}

class _FeedbackPopupState extends State<FeedbackPopup> {
  double difficultyValue = 0; // Default value

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('How was the difficulty?', style: TextStyle(fontSize: 18)),
      content: Container(
        width: 300, // Set the width to maximum
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
                  activeColor: Color(0xFF7B31F4),
                  label: difficultyValue.toString(),
                ),
                Positioned(
                  top: 35,
                  left: 12,
                  child: Text('Easy',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                Positioned(
                  top: 35,
                  left: 122,
                  child: Text('Suits Me',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                Positioned(
                  top: 35,
                  right: 0,
                  child: Text('Very Hard',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                      Color(0xFF7B31F4), // Set button color to match slider
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // Set BorderRadius
                  ),
                ),
                child: Text('Submit',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Set BorderRadius for AlertDialog
      ),
    );
  }
}
