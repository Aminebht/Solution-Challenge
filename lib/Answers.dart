import 'dart:async';
import 'dart:ui';
import 'package:app_0/Home.dart';
import 'package:flutter/material.dart';

class Answers extends StatefulWidget {
  final List<String> stuserAnswers;
  final List<String> stcorrectAnswers;
  final List<String> problems;
  final List<String> explanations;

  Answers({
    required this.stuserAnswers,
    required this.stcorrectAnswers,
    required this.problems,
    required this.explanations,
  });
  @override
  _AnswersPageState createState() => _AnswersPageState();
}

class _AnswersPageState extends State<Answers> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int numberOfQuestions = 1;
  String selectedAnswer = '240%';
  String correctAnswer = '240%';
  String explanation =
      '50 .x = 120\n=> x = 2.4\n=> 2.4 expressed as percent\nis 240 % .';
  List<List<String>> questionsMatrix =
      List.generate(6, (index) => List.filled(6, ""));

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF7B31F4),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0.1 * screenHeight,
                  bottom: 0.05 * screenHeight,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Answers Explanation',
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
              _buildBottomBox(screenHeight, screenWidth, numberOfQuestions,
                  selectedAnswer, correctAnswer, explanation),
            ],
          ),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    fetchQuestionsFromAPI();
  }

  void fetchQuestionsFromAPI() {
    // Simulate fetching questions from the API. Replace this with your actual API call.
    for (int i = 0; i < 6; i++) {
      // Replace the following lines with the actual data received from the API
      questionsMatrix[i][0] = "120 is what percent of 50 ?";
      questionsMatrix[i][1] = "5%";
      questionsMatrix[i][2] = "240 %";
      questionsMatrix[i][3] = "50 %";
      questionsMatrix[i][4] = "2 %";
      questionsMatrix[i][5] = "500 %";
    }
  }

  Widget _buildBottomBox(
      double screenHeight,
      double screenWidth,
      int numberOfQuestions,
      String selectedAnswer,
      String correctAnswer,
      String explanation) {
    String question = questionsMatrix[numberOfQuestions - 1]
        [0]; // Retrieve question from the matrix
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'QUESTION ${numberOfQuestions} OF 6',
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
            SizedBox(height: 20),
            // Question
            Text(
              '${question}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
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
            SizedBox(height: 20),
            if (selectedAnswer == correctAnswer)
              _buildAnswerBox(
                  selectedAnswer, Colors.white, Color(0xFF53DF83), screenWidth)
            else
              _buildAnswerBox(
                  selectedAnswer, Colors.white, Color(0xFFE33629), screenWidth),

            SizedBox(height: 20),
            Row(
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
            SizedBox(height: 20),
            _buildAnswerBox(correctAnswer, Color(0xFF53DF83), Color(0xFF53DF83),
                screenWidth),
            SizedBox(height: 20),
            Row(
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
            SizedBox(height: 20),
            _buildExplanationBox(explanation, screenWidth),
            SizedBox(height: 20),
            _buildSubmitAnswerButton(screenWidth, numberOfQuestions),
          ],
        ),
      ),
    );
  }
}

Widget _buildSubmitAnswerButton(double screenWidth, int numberOfQuestions) {
  return GestureDetector(
    onTap: () => goToNextAnswer(),
    child: Container(
      width: 0.8 * screenWidth,
      height: 52,
      decoration: BoxDecoration(
        color: Color(0xFF7B31F4), // Change the color to 7B31F4
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          numberOfQuestions < 6 ? 'Next' : 'Submit',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget _buildAnswerBox(
    String answer, Color color1, Color color2, double screenWidth) {
  Color textColor = (color1 == Colors.white && color2 == Color(0xFF53DF83))
      ? Color(0xFF53DF83)
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

void goToNextAnswer() {}
