import 'dart:ui';
import 'package:EducationALL/api_urls.dart';
import 'package:EducationALL/my_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:EducationALL/DoneQuestions.dart';
import 'package:hive/hive.dart';

class Answers extends StatefulWidget {
  final List<String> stuserAnswers;
  final List<String> stcorrectAnswers;
  final List<String> problems;
  final List<String> explanations;
  final String lesson;
  final int uprate;
  final int lnew;

  Answers({
    required this.stuserAnswers,
    required this.stcorrectAnswers,
    required this.problems,
    required this.explanations,
    required this.lesson,
    required this.uprate,
    required this.lnew,
  });
  @override
  // ignore: library_private_types_in_public_api
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
      backgroundColor: const Color(0xFFFEF6FF),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7B31F4),Color(0xFFFEF6FF)],
            stops: [0.5, 0.5],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (numberOfQuestions > 1) {
                          setState(() {
                            numberOfQuestions--;
                          });
                        }
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
                          color: Color(0xFFFEF6FF),
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
          color: const Color(0xFF7B31F4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            numberOfQuestions < 6 ? 'Next' : 'Submit',
            style: const TextStyle(
              color: Color(0xFFFEF6FF),
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
      
    } else {
      int countTimeouts =
          widget.stuserAnswers.where((answer) => answer == 'Timer Out').length;
      var box = await Hive.openBox('testBox');
      MyData? userData = box.values.last;

      

      String user = userData!.userId;

      
      Map<String, dynamic> requestData = {
        'user_id': user,
        'category': "total_${widget.lesson}",
        
      };

      
      Dio dio = Dio();

        Response response = await dio.get(
          APIUrls.userhistoryURL,
          queryParameters: requestData,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        
        if (response.statusCode == 200) {
          
          dynamic responseData = response.data;

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
                lnew: widget.lnew,
              ),
            ),
          );
        } 
      
    }
  }

  @override
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
    });
  }

  Widget _buildBottomBox(
    double screenHeight,
    double screenWidth,
    int numberOfQuestions,
    String selectedAnswer,
    String correctAnswer,
    String explanation,
  ) {
    String question = widget.problems[numberOfQuestions - 1];
    return SingleChildScrollView(
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFFFEF6FF),
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
                color: Color(0xFF1F1926),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.start,
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
              _buildAnswerBox(selectedAnswer, const Color(0xFFFEF6FF),
                  const Color(0xFF53DF83), screenWidth)
            else
              _buildAnswerBox(selectedAnswer, const Color(0xFFFEF6FF),
                  const Color(0xFFE33629), screenWidth),

            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.start,
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
            _buildAnswerBox(correctAnswer, const Color(0xFF53DF83),
                const Color(0xFF53DF83), screenWidth),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.start,
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
  Color textColor =
      (color1 == const Color(0xFFFEF6FF) && color2 == const Color(0xFF53DF83))
          ? const Color(0xFF53DF83)
          : (color1 == const Color(0xFFFEF6FF) && color2 == const Color(0xFFE33629))
              ? const Color(0xFFE33629)
              : const Color(0xFFFEF6FF);
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
      color: Color(0xFFFEF6FF),
    ),
    child: Text(
      explanation,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF1F1926),
      ),
    ),
  );
}
