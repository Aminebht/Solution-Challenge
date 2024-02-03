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
  List<List<String>> questionsMatrix =
      List.generate(6, (index) => List.filled(6, ""));

  @override
  Widget build(BuildContext context) {
    print('Selected Answer: ${widget.selectedAnswer}');
    print('Correct Answer: ${widget.correctAnswer}');
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF7B31F4),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0.04 * screenHeight,
                  bottom: 0.05 * screenHeight,
                ),
                child: const Row(
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
              _buildBottomBox(screenHeight, screenWidth, widget.correctAnswer,
                  widget.correctAnswer, widget.explanation),
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
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            // Question
            Text(
              widget.question,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align to the start (left)
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'SELECTED ANSWER',
                    style: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            if (widget.selectedAnswer == widget.correctAnswer)
              _buildAnswerBox(widget.selectedAnswer, Colors.white,
                  const Color(0xFF53DF83), screenWidth)
            else
              _buildAnswerBox(widget.selectedAnswer, Colors.white,
                  const Color(0xFFE33629), screenWidth),

            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align to the start (left)
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'CORRECT ANSWER',
                    style: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildAnswerBox(correctAnswer, const Color(0xFF53DF83), const Color(0xFF53DF83),
                screenWidth),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align to the start (left)
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'EXPLANATION',
                    style: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildExplanationBox(explanation, screenWidth),
            const SizedBox(height: 20),
            _buildSubmitAnswerButton(context, screenWidth),
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
                    uprate: widget.up, totalQuizDone: 40,
                  )),
        );
      },
      child: Container(
        width: 0.8 * screenWidth,
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFF7B31F4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
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

Widget _buildAnswerBox(
    String answer, Color color1, Color color2, double screenWidth) {
  Color textColor = (color1 == Colors.white && color2 == const Color(0xFF53DF83))
      ? const Color(0xFF53DF83)
      : (color1 == Colors.white && color2 == const Color(0xFFE33629))
          ? const Color(0xFFE33629)
          : Colors.white;

  String imagePath =
      (color2 == const Color(0xFFE33629)) ? 'images/no.png' : 'images/tick.png';

  return Container(
    width: 0.75 * screenWidth,
    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 30.0),
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
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: Text(
      explanation,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  );
}
