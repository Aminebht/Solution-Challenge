// ignore_for_file: file_names

import 'dart:io';
import 'package:EducationALL/api_urls.dart';
import 'package:EducationALL/Home.dart';
import 'package:EducationALL/SignUp.dart';
import 'package:EducationALL/my_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool keepSignedIn = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late SimpleFontelicoProgressDialog _progressDialog;
  Map<String, dynamic> apiResponse = {};
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _progressDialog = SimpleFontelicoProgressDialog(context: context);

    return Scaffold(
      backgroundColor: const Color(0xFFFEF6FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.33,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/sign_bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.33,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xFF1F1926),
                      ),
                    ),
                    SizedBox(
                        height:
                            6.29 * MediaQuery.of(context).size.height / 100),

                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextFormField(
                        controller:
                            _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF9F5FF),
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: const Color(0x00b2b2b2).withOpacity(0.25),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            
                            borderSide: const BorderSide(
                              color: Color(0xFF7B31F4),
                              width: 2,
                            ),
                           ),
                        ),
                        style: const TextStyle(color: Color(0xFF1F1926)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextFormField(
                        controller:
                            _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF9F5FF),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: const Color(0x00b2b2b2).withOpacity(0.25),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            
                            borderSide: const BorderSide(
                              color: Color(0xFF7B31F4),
                              width: 2,
                            ),
                           ),
                        ),
                        
                        style: const TextStyle(color: Color(0xFF1F1926)),
                      ),
                    ),

                    const SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: Row(
                        children: [
                          GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      keepSignedIn = !keepSignedIn;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFF1F1926),
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Center(
                                            child: Checkbox(
                                              value: keepSignedIn,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  keepSignedIn = value ?? false;
                                                });
                                              },
                                              checkColor: const Color(0xFFF9F5FF),
                                              activeColor: const Color(0xFF7B31F4),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Keep me signed in',
                                        style: TextStyle(
                                          color: Color(0xFF5F5F5F),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                          const Spacer(),
                          InkWell(
                            onTap: () {
                            },
                            child: const Text(
                              'Forgot Your Password?',
                              style: TextStyle(
                                color: Color(0xFF5F5F5F),
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                        height:
                            6.29 * MediaQuery.of(context).size.height / 100),

                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      height: 49,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                          
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            _progressDialog.show(message: 'Signing in...');
                            int updated = await signInWithEmailAndPassword(
                                email, password, keepSignedIn);
                            _progressDialog.hide();
                            if (updated == 0) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('keepSignedIn', keepSignedIn);

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Home(),
                              ));
                            } else {
                              if (updated == 2) {
                                // ignore: use_build_context_synchronously
                                showErrorDialog(
                                  context,
                                  'Sign-in Failed',
                                  'Check your email and password.',
                                );
                              }
                              if (updated == 1) {
                                // ignore: use_build_context_synchronously
                                showErrorDialog(
                                  context,
                                  'Connection Error',
                                  'Check your internet connection.',
                                );
                              }
                            }
                          // ignore: deprecated_member_use
                          } on DioError {
                            _progressDialog.hide();
                            // ignore: use_build_context_synchronously
                            showErrorDialog(
                              context,
                              'Connection Error',
                              'Check your internet connection.',
                            );
                          } on FirebaseAuthException catch (e) {
                            _progressDialog.hide();
                            // ignore: use_build_context_synchronously
                            showErrorDialog(context, 'Authentication Error',
                                e.message ?? '');
                          } catch (e) {
                            _progressDialog.hide();
                            // ignore: use_build_context_synchronously
                            showErrorDialog(
                              context,
                              'Sign-in Failed',
                              'An unexpected error occurred.',
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7B31F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        height:
                            6.29 * MediaQuery.of(context).size.height / 100),

                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: Row(
                        children: [
                       
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFF5F5F5F),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Or',
                            style: TextStyle(
                              color: Color(0xFF5F5F5F),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFF5F5F5F),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            color: Colors.white,
                            child: Center(
                              child: Image.asset(
                                'images/google.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: 10),
                          Container(
                            width: 42,
                            height: 42,
                            color: Colors.white,
                            child: Center(
                              child: Image.asset(
                                'images/fb.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 203, //
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style:
                              const TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF7B31F4),
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<int> signInWithEmailAndPassword(
  String email,
  String password,
  bool keepSignedIn,
) async {
  try {
    await Firebase.initializeApp();
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user != null) {
      bool scoresUpdated =
          await updateScoresFromDjango(userCredential.user!.uid, keepSignedIn);
      if (scoresUpdated) {
        return 0;
      } else {
        return 1;
      }
    } else {
      return 1;
    }
  // ignore: deprecated_member_use
  } on DioError catch (e) {
    if (e.error is SocketException) {
      
      return 1;
    } else {
      return 1;
    }
  } on FirebaseAuthException {
  
    return 2;
  } catch (e) {
    return 2;
  }
}

Dio dio = Dio();

Future<void> importUserFromFirebase(String userId, bool keepMeSignedIn) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userId = user.uid;
    }
 
}

void showErrorDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<bool> updateScoresFromDjango(String userId, bool keepMeSignedIn) async {
  final url = '${APIUrls.userstatsURL}/?type=score&user_id=$userId';



  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;
      await updateHiveDatabase(userId, keepMeSignedIn, data);
      return true;
    } else {
      return false;
    }
  // ignore: deprecated_member_use
  } on DioError {
    

    return false;
  } catch (e) {
    return false;
  }
}

Future<void> updateHiveDatabase(
    String userId, bool keepMeSignedIn, Map<String, dynamic> userScores) async {
    var box = await Hive.openBox('testBox');
    if (box.isNotEmpty) {
      final lastIndex = box.length - 1;
      await box.deleteAt(lastIndex);
    }
    MyData newData = MyData(
      userId: userId,
      userScores: userScores,
      keepMeSignedIn: keepMeSignedIn,
    );
    box.add(newData);
 
}

bool isUserSignedIn() {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}
