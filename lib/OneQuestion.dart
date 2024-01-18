import 'dart:async';
import 'package:flutter/material.dart';

class OneQuestion extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<OneQuestion> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int timerSeconds = 60;
  int selectedAnswer = -1; // To track the selected answer

  List<int?> userAnswers = List.filled(1, null); // List to store user answers

  List<String> oneQuestionData = List.filled(6, ""); // List to store one question and its options

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
    // Fetch the initial set of questions and options from the API and update the list
    fetchOneQuestionFromAPI();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void fetchOneQuestionFromAPI() {
    // Simulate fetching one question from the API. Replace this with your actual API call.
    // Replace the following lines with the actual data received from the API
    oneQuestionData[0] = "120 is what percent of 50 ?";
    oneQuestionData[1] = "5%";
    oneQuestionData[2] = "240 %";
    oneQuestionData[3] = "50 %";
    oneQuestionData[4] = "2 %";
    oneQuestionData[5] = "500 %";
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
            goToNextQuestion();
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
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildBottomBox(screenHeight, screenWidth),
          ],
        ),
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

   Widget _buildBottomBox(double screenHeight, double screenWidth) {
    String question = oneQuestionData[0]; // Retrieve question from the list
    return Container(
      width: 0.9 * screenWidth,
      height:screenHeight *0.8 ,
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

          // Question
          Text(
            '$question',
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
              _buildSelectableBox(i, oneQuestionData[i]),
              SizedBox(height: 10),
            ],
          ),
      ],
    );
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
    bool isButtonEnabled = selectedAnswer != -1;

    return GestureDetector(
      onTap: isButtonEnabled ? () => goToNextQuestion() : null,
      child: Container(
        width: 0.4 * screenWidth,
        height: 52,
        decoration: BoxDecoration(
          color: isButtonEnabled ? Color(0xFFF78AB1) : Colors.grey, // Use grey color when the button is disabled
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void goToNextQuestion() {
    // Save the user's answer for the current question
    userAnswers[0] = selectedAnswer;

    // Reset the selected answer and timer
    selectedAnswer = -1;
    timerSeconds = 60;

    // Move to the next question or submit answers if it's the last question
  }
}
