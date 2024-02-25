import 'dart:async';
import 'dart:ui';
import 'package:EducationALL/Home.dart';
import 'package:EducationALL/Answers.dart';
import 'package:EducationALL/api_urls.dart';
import 'package:EducationALL/my_data.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

class Questions extends StatefulWidget {
  final int selectedChoice;
  final int lnew;
  const Questions({super.key, required this.selectedChoice, required this.lnew});
  @override
  // ignore: library_private_types_in_public_api
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<Questions> {
  late int questionId;
  late String problem;
  late List<String> options;
  List<String> correctAnswers = [];
  List<String> stcorrectAnswers = [];
  List<String> stuserAnswers = [];
  List<String> explanations = [];
  List<String> problems = [];
  List<int> ldifficulty = [];
  late int difficulty = 0;
  late String correctAnswer;
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int numberOfQuestions = 1;
  int timerSeconds = 90;
  int selectedAnswer = -1;
  bool isError = false;
  bool isLoading = true;
  final Dio dio = Dio();
  bool isSubmitted = false;
  late List<Map<String, dynamic>> questions = [];
  List<int?> userAnswers = List.filled(6, null);
  late Timer _timer = Timer(Duration.zero, () {});
  bool isTimerPaused = false;
  late int score;
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
    startTimer();
    fetchQuestionsFromAPI();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void fetchQuestionsFromAPI() async {
    const String baseUrl = APIUrls.baseUrl;
    const String path = APIUrls.problemsearchURL;

    final Map<String, dynamic> queryParams = {
      'count': '6',
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

    if (queryParams['score'] == '0') {
      queryParams['new'] = '1';
    }
    final Uri uri =Uri.parse(baseUrl + path).replace(queryParameters: queryParams);
    try {
      final Response response = await dio.get(uri.toString());

      print('Request URL: ${uri.toString()}');
      print('Response Status Code: ${response.statusCode}');
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        dynamic responseData = response.data;

        if (responseData is List) {
          questions = responseData.map((data) {
            return {
              'id': data['id'],
              'problem': data['problem'],
              'options': (data['options'] as String)
                  .split(RegExp(r',.*?\)'))
                  .map((option) => option.replaceAll(RegExp(r"['a )\]]"), ''))
                  .toList(),
              'correctAnswer': data['correct'],
              'rationale': data['rationale'],
              'difficulty': data['difficulty_score'],
            };
          }).toList();
          for (int i = 0; i < questions.length; i++) {
            Map<String, dynamic> question = questions[i];
            correctAnswers.add(question['correctAnswer'] as String);
            stcorrectAnswers.add(question['options'][correctAnswers[i].codeUnitAt(0) - 97]);
            explanations.add((question['rationale'] as String));
            problems.add(question['problem'] as String);
            ldifficulty.add(question['difficulty'] as int);
            difficulty = (question['difficulty'] as int);
            
            if (difficulty >= 73) {
              timerSeconds = 180;
            } else {
              if (difficulty >= 50) {
                timerSeconds = 120;
              }
            }
          }
        }
      } else {
        
        setState(() {
          isError = true;
        });
      }
      await box.close();
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

  void submitAnswers() {
    _timer.cancel();
    isSubmitted = true;
    if (timerSeconds == 0) {
      selectedAnswer = -1;
    }
    goToNextQuestion(difficulty);
  }

  void startTimer() {
    _timer.cancel();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        setState(() {
          if (!isTimerPaused) {
            if (timerSeconds == 0) {
              timer.cancel();
              if (mounted) {
                goToNextQuestion(difficulty);
              }
            } else {
              timerSeconds--;
            }
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
        child: SingleChildScrollView(
          child: Column(
          children: [
            _buildBlurredBackground(),
            Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0.1 * screenHeight,
                      bottom: 0.05 * screenHeight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildIndicatorBox("$numberOfQuestions/6"),
                        const SizedBox(width: 30),
                        _buildEvolutionIndicator(numberOfQuestions),
                        const SizedBox(width: 30),
                        _buildPopupMenuButton(),
                      ],
                    ),
                  ),
                  _buildBottomBox(screenHeight, screenWidth, numberOfQuestions),
                ],
              ),
          ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlurredBackground() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }

  Widget _buildIndicatorBox(String text) {
    return Container(
      width: 42,
      height: 26,
      decoration: BoxDecoration(
        color: const Color(0x0fffffff).withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFEF6FF),
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
        color: const Color(0x0fffffff).withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Container(
            width: progress,
            height: 7,
            decoration: BoxDecoration(
              color: const Color(0xFFDCDF58),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopupMenuButton() {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return ['Pause Timer', 'Exit'].map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
      onSelected: (String choice) {
        if (choice == 'Pause Timer') {
          pauseTimer();
        } else if (choice == 'Exit') {
          _timer.cancel();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Home(),
          ));
        }
      },
      child: Container(
        width: 42,
        height: 26,
        decoration: BoxDecoration(
          color: const Color(0x0fffffff).withOpacity(0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Image.asset('images/setting.png'),
        ),
      ),
    );
  }

  void pauseTimer() {
    // Pause the timer
    _timer.cancel();
    setState(() {
      isTimerPaused = true;
    });
    _showPauseIconOverlay();
  }

  void resumeTimer() {
    setState(() {
      isTimerPaused = false;
    });

    // Restart the timer with the remaining time
    startTimer();
  }

  void _showPauseIconOverlay() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0),
          child: AlertDialog(
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); 
                      resumeTimer();
                    },
                    child: const Icon(
                      Icons.play_arrow,
                      color: Color(0xFFFEF6FF),
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tap to Resume',
                    style: TextStyle(color: Color(0xFFFEF6FF)),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
        );
      },
    );
  }

  Widget _buildBottomBox(
    double screenHeight,
    double screenWidth,
    int numberOfQuestions,
  ) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (isError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error occurred while fetching data.'),
          ElevatedButton(
            onPressed: fetchQuestionsFromAPI,
            child: const Text('Retry'),
          ),
        ],
      );
    }

    if (questions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    String question = questions[numberOfQuestions - 1]['problem'];

    return Container(
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
          _buildTimer(),
          const SizedBox(height: 20),
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
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            question,
            style: const TextStyle(
              color: Color(0xFF1F1926),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildSelectableBoxes(),
          const SizedBox(height: 20),
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
        for (String option in questions[numberOfQuestions - 1]['options'])
          Column(
            children: [
              _buildSelectableBox(option),
              const SizedBox(height: 10),
            ],
          ),
      ],
    );
  }

  Widget _buildSelectableBox(String optionText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer =
              questions[numberOfQuestions - 1]['options'].indexOf(optionText) +
                  1;
        });
      },
      child: Container(
        width: 0.9 * screenWidth,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selectedAnswer ==
                  questions[numberOfQuestions - 1]['options']
                          .indexOf(optionText) +
                      1
              ? const Color(0xFFE5D4FF)
              : const Color(0xFFFEF6FF),
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
    bool isButtonEnabled = selectedAnswer != -1 || timerSeconds == 0;

    return GestureDetector(
      onTap: isButtonEnabled ? () => submitAnswers() : null,
      child: Container(
        width: 0.4 * screenWidth,
        height: 52,
        decoration: BoxDecoration(
          color: isButtonEnabled ? const Color(0xFFF78AB1) : Colors.grey,
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

  void initializeTimer(int difficulty) {
    if (difficulty >= 73) {
      timerSeconds = 180;
    } else if (difficulty >= 50) {
      timerSeconds = 120;
    } else {
      timerSeconds = 90;
    }
  }

  Future<void> goToNextQuestion(int difficulty) async {
    int up;
      if (timerSeconds == 0) {
        userAnswers[numberOfQuestions - 1] = -1;
      } else {
  
        userAnswers[numberOfQuestions - 1] = selectedAnswer;
      }

      selectedAnswer = -1;

      if (numberOfQuestions < 6) {
        

        setState(() {
          numberOfQuestions++;
        });

        
        initializeTimer(difficulty);
        startTimer();
      } else {
        bool bpressed = false;
        if (!bpressed) {
          bpressed = true;
          setState(() {
        });
          for (int i = 0; i < 6; i++) {
            if (userAnswers[i] != -1) {
              stuserAnswers.add(questions[i]['options'][userAnswers[i]! - 1]);
            } else {
              stuserAnswers.add('Timer Out');
            }
          }
        
          if (widget.lnew == 1) {
            up = await setscore(stuserAnswers, stcorrectAnswers);
          } else {
            up =await updateScore(ldifficulty, stuserAnswers, stcorrectAnswers);
          }

          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Answers(
                  stuserAnswers: stuserAnswers,
                  stcorrectAnswers: stcorrectAnswers,
                  problems: problems,
                  explanations: explanations,
                  lesson: lessons[widget.selectedChoice],
                  uprate: up,
                  lnew: widget.lnew),
            ),
          );
        }
      }
    
  }

  Future<int> updateScore(
    List<int> difficultyList,
    List<String> userAnswers,
    List<String> correctAnswers,
  ) async {
    
      double averageDifficulty = difficultyList.reduce((value, element) => value + element) / difficultyList.length;
      int correctCount = 0;
      for (int i = 0; i < userAnswers.length; i++) {
        if (userAnswers[i] == correctAnswers[i]) {
          correctCount++;
        }
      }

      var box = await Hive.openBox('testBox');
      MyData? userData = box.values.last;
      if (userData != null) {
        String selectedCategory = lessons[widget.selectedChoice];
        int uprate = 0;
        Map<String, int> params ={
    "Current_Score": userData.userScores[selectedCategory],
    "Average":correctCount,
    "Average_diff": averageDifficulty.round(),

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

        const String apiUrl = APIUrls.userscoresURL;
        const String apiUrl1 = APIUrls.userhistoryURL;
        Response historyResponse = await dio.get(APIUrls.userhistoryURL,
          queryParameters: {
            'user_id': userData.userId,
            'category': "total_$selectedCategory",
          },
        );
        int userHistory;
        if (historyResponse.statusCode == 200) {
          if (historyResponse.data is int) {
            userHistory = historyResponse.data;
          } else {
           
            return 0;
          }
          Map<String, dynamic> requestBody = {
            "user_id": userData.userId,
            "category": selectedCategory,
            "new_score": newScore,
          };

          Map<String, dynamic> requestBody1 = {
            "user_id": userData.userId,
            "category": "total_$selectedCategory",
            "new_history": userHistory + 6,
          };

          await dio.patch(
            apiUrl,
            data: requestBody,
            options: Options(
              headers: {'Content-Type': 'application/json'},
            ),
          );

          await dio.patch(
            apiUrl1,
            data: requestBody1,
            options: Options(
              headers: {'Content-Type': 'application/json'},
            ),
          );
          return uprate;
        } else {
         
          return 0;
        }
      } else {
       
        return 0;
      }
  }

  Future<int> setscore(
      List<String> stuserAnswers, List<String> stcorrectAnswers) async {
    List<int> result = [];
    List<int> coeffs = [1, 3, 4, 6, 7, 9];
    dynamic s = 0;
    for (int i = 0; i < stuserAnswers.length; i++) {
      if (stuserAnswers[i] == stcorrectAnswers[i]) {
        result.add(1);
        s = s + coeffs[i];
      } else {
        result.add(0);
      }
    }
    s = ((s * 7) / 3) + 10;
    s = s.round();
    var box = await Hive.openBox('testBox');
    MyData? userData = box.values.last;
    if (userData != null) {
      String selectedCategory = lessons[widget.selectedChoice];
      int newScore = s;
      userData.userScores[selectedCategory] = newScore;
      box.put(userData.userId, userData);
      const String apiUrl = APIUrls.userscoresURL;
      Dio dio = Dio();
      Map<String, dynamic> requestBody = {
        "user_id": userData.userId,
        "category": selectedCategory,
        "new_score": newScore,
      };
        Response response = await dio.patch(
          apiUrl,
          data: requestBody,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        if (response.statusCode == 200) {
          return s;
        } else {
          return 0;
        }
      
    } else {
      return 0;
    }
  }
}
