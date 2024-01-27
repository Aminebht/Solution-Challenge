import 'package:flutter/material.dart';
import 'package:app_0/Home.dart';

class Done extends StatelessWidget {
  final int numberOfCorrectAnswers;
  final int numberOfTimeOut;
  final int numberOfIncorrectAnswers;
  final String selectedLesson;
  final int totalQuizDone;

  Done({
    required this.numberOfCorrectAnswers,
    required this.numberOfTimeOut,
    required this.numberOfIncorrectAnswers,
    required this.selectedLesson,
    required this.totalQuizDone,
  });

  @override
  Widget build(BuildContext context) {
    double accuracy = (numberOfCorrectAnswers / 6 * 100).truncateToDouble();
    String chaine;
    int score = 5;
    accuracy >= 50 ? chaine = 'Increased' : chaine = 'decreased';

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                accuracy >= 50 ? 'Good Job!' : 'Not Bad!',
                style: const TextStyle(
                  color: Colors.black,
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
                      accuracy >= 50 ? 'images/cup.png' : 'images/sad.png',
                      height: 173.6,
                      width: 150,
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 290,
                      child: Text(
                        'Your Score in "$selectedLesson" $chaine with $score%',
                        style: TextStyle(
                          color: Colors.white,
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
                  color: Colors.black,
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
                      SizedBox(width: 130),
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
                      SizedBox(width: 170),
                      _buildInfoElement(
                          'INCORRECT ANSWER', '$numberOfIncorrectAnswers'),
                    ],
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the Home page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF7B31F4),
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
                            color: Colors.white,
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
              color: Colors.black,
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
