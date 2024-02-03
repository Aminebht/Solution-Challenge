import 'package:app_0/home.dart';
import 'package:app_0/main.dart';
import 'package:flutter/material.dart';

class DoneQuestions extends StatelessWidget {
  final int numberOfCorrectAnswers;
  final int numberOfTimeOut;
  final int numberOfIncorrectAnswers;
  final String selectedLesson;
  final int totalQuizDone;
  final int uprate;

  DoneQuestions({
    required this.numberOfCorrectAnswers,
    required this.numberOfTimeOut,
    required this.numberOfIncorrectAnswers,
    required this.selectedLesson,
    required this.totalQuizDone,
    required this.uprate,
  });

  @override
  Widget build(BuildContext context) {
    double accuracy = (numberOfCorrectAnswers / 6 * 100).truncateToDouble();
    String chaine;
    int score = uprate;
    accuracy >= 50 ? chaine = 'Increased' : chaine = 'decreased';

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        child: Column(
        
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                accuracy >= 50 ? 'Good Job!' : 'Not Bad!',
                style: const TextStyle(
                  color: Colors.black,
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
                      accuracy >= 50 ? 'images/cup.png' : 'images/sad.png',
                      height: 173.6,
                      width: 150,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 290,
                      child: Text(
                        'Your Score in "$selectedLesson" $chaine with  $score%',
                        style: const TextStyle(
                          color: Colors.white,
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
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center horizontally
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoElement(
                          'CORRECT ANSWER', '$numberOfCorrectAnswers'),
                      const SizedBox(width: 130),
                      _buildInfoElement('ACCURACY', '$accuracy%'),
                      const SizedBox(width: 55),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center horizontally
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoElement('TIMER OUT', '$numberOfTimeOut'),
                      const SizedBox(width: 170),
                      _buildInfoElement(
                          'INCORRECT ANSWER', '$numberOfIncorrectAnswers'),
                    ],
                  ),
                  const SizedBox(height: 50),
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
    ),
    );
  }

  Widget _buildInfoElement(String title, String value) {
    return Column(
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
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
