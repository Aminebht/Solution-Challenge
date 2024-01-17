import 'dart:async';
import 'package:flutter/material.dart';

class questions extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<questions> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int numberOfQuestions = 1;
  int timerSeconds = 120;
  int selectedAnswer = -1; // To track the selected answer

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        setState(() {
          if (timerSeconds == 0) {
            timer.cancel();
            // Handle when the timer reaches 0 (e.g., move to the next question)
          } else {
            timerSeconds--;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF7B31F4),
      body: SingleChildScrollView(
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
                  // Left Box
                  _buildIndicatorBox("${numberOfQuestions}/6"),

                  // Spacing
                  SizedBox(width: 30),

                  // Evolution Indicator
                  _buildEvolutionIndicator(numberOfQuestions),

                  // Spacing
                  SizedBox(width: 30),

                  // Right Box with Image
                  _buildIndicatorBoxWithImage(),
                ],
              ),
            ),

            // Big Box at the bottom
            _buildBottomBox(screenHeight, screenWidth, numberOfQuestions),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorBox(String text) {
    return Container(
      width: 42,
      height: 26,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFFF8F8F8),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildEvolutionIndicator(int numberOfQuestions) {
    double indicatorWidth = 156;
    double progress = (numberOfQuestions / 6) * indicatorWidth;

    return Container(
      width: indicatorWidth,
      height: 7,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFF).withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Container(
            width: progress,
            height: 7,
            decoration: BoxDecoration(
              color: Color(0xFFDCDF58),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicatorBoxWithImage() {
    return Container(
      width: 42,
      height: 26,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Image.asset('images/setting.png'),
      ),
    );
  }

  Widget _buildBottomBox(
      double screenHeight, double screenWidth, int numberOfQuestions) {
    String question = "120 is what percent of 50 ?";
    return Container(
      width: 0.9 * screenWidth,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Timer
          _buildTimer(),
          SizedBox(height: 20),

          // Question Number Text
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align to the start (left)
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'QUESTION ${numberOfQuestions} OF 6',
                  style: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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

          // Selectable boxes
          _buildSelectableBoxes(),

          SizedBox(height: 20),

          // Submit Answer button
          _buildSubmitAnswerButton(),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: Color(0xFFF78AB1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _formatTime(timerSeconds),
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    String secondsStr = remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    if (minutesStr == '00') {
      return '$secondsStr';
    } else {
      return '$minutesStr:$secondsStr';
    }
  }

  Widget _buildSelectableBoxes() {
    return Column(
      children: [
        for (int i = 1; i <= 5; i++)
          Column(
            children: [
              _buildSelectableBox(i, _getOptionValue(i)),
              SizedBox(height: 10),
            ],
          ),
      ],
    );
  }

  String _getOptionValue(int optionNumber) {
    String Option1 = "5%";
    String Option2 = "240 %";
    String Option3 = "50 %";
    String Option4 = "2 %";
    String Option5 = "500 %";
    switch (optionNumber) {
      case 1:
        return Option1;
      case 2:
        return Option2;
      case 3:
        return Option3;
      case 4:
        return Option4;
      case 5:
        return Option5;
      default:
        return '';
    }
  }

  Widget _buildSelectableBox(int index, String optionText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = index;
        });
      },
      child: Container(
        width: 0.7 * screenWidth,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selectedAnswer == index ? Color(0xFFE5D4FF) : Colors.white,
          border: Border.all(color: Color(0xFFD7D7D7)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Text(
              optionText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitAnswerButton() {
    return Container(
      width: 0.4 * screenWidth,
      height: 52,
      decoration: BoxDecoration(
        color: Color(0xFFF78AB1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          'Submit Answer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
