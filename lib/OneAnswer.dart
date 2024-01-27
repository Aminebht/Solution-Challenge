//import 'dart:js';
//import 'dart:js';
import 'dart:ui';
import 'package:app_0/DoneOneQuestion.dart';
import 'package:app_0/Home.dart';
import 'package:flutter/material.dart';

class OneAnswer extends StatefulWidget {
  final String selectedAnswer;
  final String correctAnswer;
  final String question;
  final String explanation;
  final String lesson;
  final int up;

  OneAnswer({
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.question,
    required this.explanation,
    required this.lesson,
    required this.up,
  });
  
  @override
  _AnswersPageState createState() => _AnswersPageState();
}

class _AnswersPageState extends State<OneAnswer> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  List<List<String>> questionsMatrix = List.generate(6, (index) => List.filled(6, ""));
  bool verif = false; // Define your boolean variable

  @override
  Widget build(BuildContext context) {
    print('Selected Answer: ${widget.selectedAnswer}');
    print('Correct Answer: ${widget.correctAnswer}');
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    // Initialize 'var' based on selectedAnswer and correctAnswer
    verif = (widget.selectedAnswer == widget.correctAnswer);

    return Scaffold(
      backgroundColor: Color(0xFF7B31F4),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0.04 * screenHeight,
                  bottom: 0.05 * screenHeight,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Answer Explanation',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              _buildBottomBox(
                screenHeight,
                screenWidth,
                widget.correctAnswer,
                widget.correctAnswer, // Corrected: Pass the correct answer here
                widget.explanation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBox(double screenHeight, double screenWidth,
      String selectedAnswer, String correctAnswer, String explanation) {
    return SingleChildScrollView(
      child: Container(
        width: 0.9 * screenWidth,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ... (existing code)

            SizedBox(height: 20),
            _buildSubmitAnswerButton(context, screenWidth,verif),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitAnswerButton(BuildContext context, double screenWidth) {
    return GestureDetector(
      onTap: () {
        print("Men page l anwer printit l uprate");
        print(widget.up);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DoneOneQuestion(
                    selectedLesson: widget.lesson,
                    uprate: widget.up,
                  )),
        );
      },
      child: Container(
        width: 0.8 * screenWidth,
        height: 52,
        decoration: BoxDecoration(
          color: Color(0xFF7B31F4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            'Done',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// ... (rest of your existing code)




Widget _buildAnswerBox(
    String answer, Color color1, Color color2, double screenWidth) {
  Color textColor = (color1 == Colors.white && color2 == Color(0xFF53DF83))
      ? Color(0xFF53DF83)
      : (color1 == Colors.white && color2 == Color(0xFFE33629))
          ? Color(0xFFE33629)
          : Colors.white;

  String imagePath =
      (color2 == Color(0xFFE33629)) ? 'images/no.png' : 'images/tick.png';

  return Container(
    width: 0.75 * screenWidth,
    padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 30.0),
    decoration: BoxDecoration(
      color: color1,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: color2),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            answer,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ),
        Image.asset(
          imagePath,
        ),
      ],
    ),
  );
}

Widget _buildExplanationBox(String explanation, double screenWidth) {
  return Container(
    width: 0.9 * screenWidth,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Text(
      explanation,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  );
}
