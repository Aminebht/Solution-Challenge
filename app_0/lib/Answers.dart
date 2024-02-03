import 'dart:async';
import 'dart:ui';
import 'package:app_0/Home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app_0/DoneQuestions.dart';

class Answers extends StatefulWidget {
  final List<String> stuserAnswers;
  final List<String> stcorrectAnswers;
  final List<String> problems;
  final List<String> explanations;
  final String lesson;
  final int uprate;


 Answers({
    required this.stuserAnswers,
    required this.stcorrectAnswers,
    required this.problems,
    required this.explanations,
    required this.lesson,
    required this.uprate,
  });
  @override
  _AnswersPageState createState() => _AnswersPageState();
}

class _AnswersPageState extends State<Answers> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int numberOfQuestions = 1;
  int numTimerout = 0;
  int average = 0;
  int correctCount = 0;
  @override
  Widget build(BuildContext context) {
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
              _buildBottomBox(
                  screenHeight,
                  screenWidth,
                  numberOfQuestions,
                  widget.stuserAnswers[numberOfQuestions - 1],
                  widget.stcorrectAnswers[numberOfQuestions - 1],
                  widget.explanations[numberOfQuestions - 1]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitAnswerButton(double screenWidth, int numberOfQuestions) {
    return GestureDetector(
      onTap: () => goToNextAnswer(),
      child: Container(
        width: 0.8 * screenWidth,
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFF7B31F4), // Change the color to 7B31F4
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            numberOfQuestions < 6 ? 'Next' : 'Submit',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void goToNextAnswer() async {
    if (numberOfQuestions < 6) {
      setState(() {
        numberOfQuestions++;
      });
      // Restart the timer for the new questions
    } else {
      int countTimeouts =
          widget.stuserAnswers.where((answer) => answer == 'Timer Out').length;

      // Prepare data for the Dio request
      Map<String, dynamic> requestData = {
        'user_id': '8qaXEQQVQmMfeVaFGWanlVNzyAX2',
        'category': 'total_gain',
        // Add any other necessary data
      };

      // Create Dio instance
      Dio dio = Dio();

      try {
        // Make the Dio request
        Response response = await dio.get(
          'http://10.0.2.2:8000/api/user/history/',
          queryParameters: requestData,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        // Check if the request was successful (status code 200)
        if (response.statusCode == 200) {
          // Parse the response if needed
          dynamic responseData = response.data;

          // Navigate to the next page or perform the final action
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DoneQuestions(
                numberOfCorrectAnswers: correctCount,
                numberOfTimeOut: countTimeouts,
                numberOfIncorrectAnswers: 6 - correctCount - countTimeouts,
                selectedLesson: widget.lesson,
                totalQuizDone: responseData,
                uprate: widget.uprate,
                // Pass any additional data from the response if needed
              ),
            ),
          );
        } else {
          // Handle the case where the request was not successful
          print('Error: ${response.statusCode}');
        }
      } catch (error) {
        // Handle any Dio errors
        print('Dio error: $error');
      }
    }
  }

  void initState() {
    super.initState();
    calculateAverage();
  }

  void calculateAverage() {
    for (int i = 0; i < widget.stuserAnswers.length; i++) {
      if (widget.stuserAnswers[i] == widget.stcorrectAnswers[i]) {
        correctCount++;
      }
    }
    setState(() {
      // Trigger a rebuild when correctCount changes
    });
    print("Number of correct answers: $correctCount");
  }

  Widget _buildBottomBox(
    double screenHeight,
    double screenWidth,
    int numberOfQuestions,
    String selectedAnswer,
    String correctAnswer,
    String explanation,
  ) {
    String question = widget
        .problems[numberOfQuestions - 1]; // Retrieve question from the matrix
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'QUESTION $numberOfQuestions OF 6',
                    style: const TextStyle(
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
            // Question
            Text(
              question,
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
            if (selectedAnswer == correctAnswer)
              _buildAnswerBox(
                  selectedAnswer, Colors.white, const Color(0xFF53DF83), screenWidth)
            else
              _buildAnswerBox(
                  selectedAnswer, Colors.white, const Color(0xFFE33629), screenWidth),

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
            _buildSubmitAnswerButton(screenWidth, numberOfQuestions),
          ],
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
