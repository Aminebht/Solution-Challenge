import 'dart:convert';

import 'package:EducationALL/OneAnswer.dart';
import 'package:EducationALL/api_urls.dart';
import 'package:EducationALL/my_data.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class OneQuestion extends StatefulWidget {
  final int selectedChoice;

  OneQuestion({required this.selectedChoice});

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<OneQuestion> {
  late int questionId;
  late String problem;
  late List<String> options;
  late String correctAnswer;
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int timerSeconds = 90;
  int selectedAnswer = -1;
  String stcorrectAnswer = '';
  List<String> oneQuestionData = List.filled(6, "");
  String explanation = '';
  late Timer _timer;
  final Dio dio = Dio();
  bool isLoading = true;
  bool isError = false;
  int difficulty = 0;
  late String stSelectedAnswer;
  List<String> lessons = [
    'algebra',
    'gain',
    'geometry',
    'general',
    'physics',
    'static',
    'probability',
    'other'
  ];
  @override
  void initState() {
    super.initState();
    fetchData();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF7B31F4), Color(0xFFFEF6FF)],
            stops: [0.5, 0.5],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                isLoading
                    ? _buildLoadingIndicator()
                    : isError
                        ? _buildErrorUI()
                        : _buildBottomBox(screenHeight, screenWidth),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorUI() {
    return Center(
      child: Text(
        'An error occurred. Please try again.',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildBottomBox(double screenHeight, double screenWidth) {
    String question = problem;
    //double boxHeight = screenHeight * 0.7;
    double boxWidth = screenWidth;

    return Container(
      width: boxWidth,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Color(0xFFFEF6FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTimer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              // Wrap the Text widget with Container
              margin:
                  EdgeInsets.only(bottom: 10), // Adjust the margin as needed
              child: Text(
                '$question',
                style: TextStyle(
                  color: Color(0xFF1F1926),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          _buildSelectableBoxes(),
          _buildSubmitAnswerButton(),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Color(0xFFF78AB1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _formatTime(timerSeconds),
          style: TextStyle(
            color: Color(0xFFFEF6FF),
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
    String secondsStr =
        remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
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
              _buildSelectableBox(i, options[i - 1]),
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
          print(selectedAnswer);
        });
      },
      child: Container(
        width: 0.9 * screenWidth,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color:
              selectedAnswer == index ? Color(0xFFE5D4FF) : Color(0xFFFEF6FF),
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
                color: Color(0xFF1F1926),
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
          color: isButtonEnabled ? Color(0xFFF78AB1) : Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            'Submit',
            style: TextStyle(
              color: Color(0xFFFEF6FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void fetchData() async {
    print(isUserSignedIn());
    print(widget.selectedChoice);
    final String baseUrl = '${APIUrls.baseUrl}';
    final String path = '${APIUrls.problemsearchURL}';
    List<String> lessons = [
      'algebra',
      'gain',
      'geometry',
      'general',
      'physics',
      'static',
      'probability',
      'other'
    ];
    print(lessons[widget.selectedChoice]);

    final Map<String, dynamic> queryParams = {
      'count': '1',
      'category': lessons[widget.selectedChoice],
      'score': '0',
      'new': '0',
    };
    var box = await Hive.openBox('testBox');
    MyData? userData = box.values.last;
    if (userData != null &&
        userData.userScores.containsKey(lessons[widget.selectedChoice])) {
      queryParams['score'] =
          userData.userScores[lessons[widget.selectedChoice]].toString();
    }

    print(queryParams);
    final Uri uri =
        Uri.parse(baseUrl + path).replace(queryParameters: queryParams);

    try {
      print("taw bch nab3ath");
      final Response response = await dio.get(uri.toString());

      print('Request URL: ${uri.toString()}');
      print('Response Status Code: ${response.statusCode}');
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        questionId = data['id'];
        problem = data['problem'];
        options = (data['options'] as String)
            .split(RegExp(r',.*?\)'))
            .map((option) => option.replaceAll(RegExp(r"['a )\]]"), ''))
            .toList();
        correctAnswer = data['correct'];
        explanation = (data['rationale'] as String);
        print('\n');
        print(explanation);
        print('\n');
        stcorrectAnswer = options[correctAnswer.codeUnitAt(0) - 97];
        difficulty = (data['difficulty_score'] as int);
        print(difficulty);
        if (difficulty >= 73) {
          timerSeconds = 180;
        } else {
          if (difficulty >= 50) {
            timerSeconds = 120;
          }
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        setState(() {
          isError = true;
        });
      }
    } catch (error, stackTrace) {
      if (error is DioError) {
        print('DioError during the HTTP request: ${error.message}');
        print('DioError response: ${error.response}');
      } else {
        print('Error during the HTTP request: $error');
        print('Stack trace: $stackTrace');
      }
      setState(() {
        isError = true;
      });
    } finally {
      dio.close();
      setState(() {
        isLoading = false;
      });
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        setState(() {
          if (timerSeconds == 0) {
            timer.cancel();

            goToNextQuestion();
          } else {
            timerSeconds--;
          }
        });
      },
    );
  }

  Future<void> goToNextQuestion() async {
    //timerSeconds = 60;
    print('Selected Choice in OneQuestion: ${widget.selectedChoice}');
    print('Selected Answer in OneQuestion: ${selectedAnswer}');
    if (timerSeconds == 0) {
      stSelectedAnswer = 'Timer Out';
    } else {
      stSelectedAnswer = options[selectedAnswer - 1];
    }
    _timer.cancel();
    int up = await updateScore(difficulty, stSelectedAnswer, stcorrectAnswer);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OneAnswer(
            selectedAnswer: stSelectedAnswer,
            correctAnswer: stcorrectAnswer,
            question: problem,
            explanation: explanation,
            lesson: lessons[widget.selectedChoice],
            up: up),
      ),
    );
  }

  Future<int> updateScore(
    int difficulty,
    String user,
    String correct,
  ) async {
    int correctCount = user == correct ? 4 : 2;

    try {
      var box = await Hive.openBox('testBox');
      MyData? userData = box.values.last;

      if (userData != null) {
        String selectedCategory = lessons[widget.selectedChoice];
        int uprate=0;
        Map<String, int> params ={
    "Current_Score": userData.userScores[selectedCategory],
    "Average":correctCount,
    "Average_diff": difficulty,

};
        final String aiUrl = '${APIUrls.AiUrl}';
        Dio dio = Dio();
        final Response aiResponse = await dio.post(
          aiUrl,
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
          data: jsonEncode(params),
        );
        // Update user score locally in the Hive box
        print(aiResponse);
        print(aiResponse.data['prediction']);
        uprate =  aiResponse.data['prediction'].round();
        // Update user score locally in the Hive box
        int newScore = userData.userScores[selectedCategory] + uprate;
        userData.userScores[selectedCategory] = newScore;
        box.put(userData.userId, userData); // Assuming userId is unique

        // Make API request to update the score on the server
        final String apiUrl = '${APIUrls.userscoresURL}';
        final String apiUrl1 = '${APIUrls.userhistoryURL}';

        final Map<String, dynamic> requestBody = {
          "user_id": userData.userId,
          "category": selectedCategory,
          "new_score": newScore,
        };

        // Fetch user history
        Response historyResponse = await Dio().get(
          apiUrl1,
          queryParameters: {
            'user_id': userData.userId,
            'category': 'total_$selectedCategory',
          },
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
        );

        if (historyResponse.statusCode == 200) {
          int currentHistory = historyResponse.data;

          final Map<String, dynamic> requestBody1 = {
            "user_id": userData.userId,
            "category": "total_$selectedCategory",
            "new_history": currentHistory + 1,
          };

          // Update score
          Response response = await Dio().patch(
            apiUrl,
            data: requestBody,
            options: Options(
              headers: {'Content-Type': 'application/json'},
            ),
          );

          if (response.statusCode == 200) {
            print("Category $selectedCategory updated successfully.");
          } else {
            print(
                "Failed to update category $selectedCategory. Status code: ${response.statusCode}");
            print("Response data: ${response.data}");
          }

          // Update history
          Response response1 = await Dio().patch(
            apiUrl1,
            data: requestBody1,
            options: Options(
              headers: {'Content-Type': 'application/json'},
            ),
          );

          if (response1.statusCode == 200) {
            print("History updated successfully.");
          } else {
            print(
                "Failed to update history. Status code: ${response1.statusCode}");
            print("Response data: ${response1.data}");
          }

          return uprate;
        } else {
          print(
              'Failed to fetch user history. Status code: ${historyResponse.statusCode}');
          print('Response data: ${historyResponse.data}');
          return 0;
        }
      } else {
        print("User data not available");
        return 0;
      }
    } catch (e) {
      print("Error during the updateScore operation: $e");
      return 0;
    }
  }
}

bool isUserSignedIn() {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}
