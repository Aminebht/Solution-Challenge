import 'package:flutter/material.dart';

class DoneOneQuestion extends StatelessWidget {
  final String selectedLesson;

  final bool correctAnswer;

  DoneOneQuestion({
    required this.selectedLesson,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    String chaine;
    int score = 5;

    correctAnswer ? chaine = 'Increased' : chaine = 'Decreased';

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                correctAnswer ? 'Good Job!' : 'Not Bad!',
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
                  color: Color(0xFFF78AB1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      correctAnswer ? 'images/cup.png' : 'images/sad.png',
                      height: 173.6,
                      width: 150,
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 290,
                      child: Text(
                        'Your Score in "$selectedLesson" $chaine with $score%',
                        style: const TextStyle(
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
              const SizedBox(height: 50),
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
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
      ),
    );
  }
}
