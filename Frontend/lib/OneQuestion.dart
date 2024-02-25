// ignore_for_file: file_names
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

  const OneQuestion({super.key, required this.selectedChoice});

  @override
  // ignore: library_private_types_in_public_api
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7B31F4), Color(0xFFFEF6FF)],
            stops: [0.5, 0.5],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                isLoading
                    ? _buildLoadingIndicator()
                    : isError
                        ? _buildErrorUI()
                        : _buildBottomBox(screenHeight, screenWidth),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorUI() {
    return const Center(
      child: Text(
        'An error occurred. Please try again.',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildBottomBox(double screenHeight, double screenWidth) {
    String question = problem;
    double boxWidth = screenWidth;

    return Container(
      width: boxWidth,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF6FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTimer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
             
              margin:
                  const EdgeInsets.only(bottom: 10), 
              child: Text(
                question,
                style: const TextStyle(
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
      decoration: const BoxDecoration(
        color: Color(0xFFF78AB1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _formatTime(timerSeconds),
          style: const TextStyle(
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
      return secondsStr;
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
              const SizedBox(height: 10),
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
        width: 0.9 * screenWidth,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color:
              selectedAnswer == index ? const Color(0xFFE5D4FF) : const Color(0xFFFEF6FF),
          border: Border.all(color: const Color(0xFFD7D7D7)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Text(
              optionText,
              style: const TextStyle(
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
          color: isButtonEnabled ? const Color(0xFFF78AB1) : Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
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
    const String baseUrl = APIUrls.baseUrl;
    const String path = APIUrls.problemsearchURL;
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

    
    final Uri uri = Uri.parse(baseUrl + path).replace(queryParameters: queryParams);

    try {
      final Response response = await dio.get(uri.toString());
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
        stcorrectAnswer = options[correctAnswer.codeUnitAt(0) - 97];
        difficulty = (data['difficulty_score'] as int);
        if (difficulty >= 73) {
          timerSeconds = 180;
        } else {
          if (difficulty >= 50) {
            timerSeconds = 120;
          }
        }
      } else {
        setState(() {
          isError = true;
        });
      }
    } catch (error) {
      
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
    const oneSec = Duration(seconds: 1);
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
   
    if (timerSeconds == 0) {
      stSelectedAnswer = 'Timer Out';
    } else {
      stSelectedAnswer = options[selectedAnswer - 1];
    }
    _timer.cancel();
    int up = await updateScore(difficulty, stSelectedAnswer, stcorrectAnswer);
    // ignore: use_build_context_synchronously
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
        const String aiUrl = APIUrls.AiUrl;
        Dio dio = Dio();
        final Response aiResponse = await dio.post(
          aiUrl,
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
          data: jsonEncode(params),
        );
        uprate =  aiResponse.data['prediction'].round();
        
        int newScore = userData.userScores[selectedCategory] + uprate;
        userData.userScores[selectedCategory] = newScore;
        box.put(userData.userId, userData);
        const String apiUrl1 = APIUrls.userhistoryURL;

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

          Response response1 = await Dio().patch(
            apiUrl1,
            data: requestBody1,
            options: Options(
              headers: {'Content-Type': 'application/json'},
            ),
          );

          if (response1.statusCode == 200) {
          } else {
          }

          return uprate;
        } else {
          return 0;
        }
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }
}

bool isUserSignedIn() {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}
