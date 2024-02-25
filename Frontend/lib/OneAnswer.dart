// ignore_for_file: file_names

import 'package:EducationALL/DoneOneQuestion.dart';
import 'package:EducationALL/api_urls.dart';
import 'package:EducationALL/my_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OneAnswer extends StatefulWidget {
  final String selectedAnswer;
  final String correctAnswer;
  final String question;
  final String explanation;
  final String lesson;
  final int up;

  const OneAnswer({super.key, 
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.question,
    required this.explanation,
    required this.lesson,
    required this.up,
  });
  @override
  // ignore: library_private_types_in_public_api
  _AnswersPageState createState() => _AnswersPageState();
}

class _AnswersPageState extends State<OneAnswer> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  List<List<String>> questionsMatrix =
      List.generate(6, (index) => List.filled(6, ""));

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7B31F4),Color(0xFFFEF6FF)],
            stops: [0.5, 0.5],
          ),
        ),
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
                        color: Color(0xFFFEF6FF),
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
            const SizedBox(height: 20),
            // Question
            Text(
              widget.question,
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

            if (widget.selectedAnswer == widget.correctAnswer)
              _buildAnswerBox(widget.selectedAnswer, const Color(0xFFFEF6FF),
                  const Color(0xFF53DF83), screenWidth)
            else
              _buildAnswerBox(widget.selectedAnswer, const Color(0xFFFEF6FF),
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
            _buildSubmitAnswerButton(context, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitAnswerButton(BuildContext context, double screenWidth) {
    return GestureDetector(
      onTap: () async {
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
                  builder: (context) => DoneOneQuestion(
                        selectedLesson: widget.lesson,
                        uprate: widget.up,
                        totalQuizDone: responseData,
                      )),
            );
          }
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
              color: Color(0xFFFEF6FF),
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
  Color textColor =
      (color1 == const Color(0xFFFEF6FF) && color2 == const Color(0xFF53DF83))
          ? const Color(0xFF53DF83)
          : (color1 == const Color(0xFFFEF6FF) && color2 == const Color(0xFFE33629))
              ? const Color(0xFFE33629)
              : const Color(0xFFFEF6FF);

  String imagePath =
      (color2 == const Color(0xFFE33629)) ? 'images/no.png' : 'images/tick.png';

  return Container(
    width: 0.8 * screenWidth,
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
    width: 0.8 * screenWidth,
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