// ignore_for_file: file_names, use_build_context_synchronously
import 'package:EducationALL/api_urls.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:EducationALL/SignIn.dart';
// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  late SimpleFontelicoProgressDialog _progressDialog;

  SignUp({super.key});

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
              top: MediaQuery.of(context).size.height * 0.21,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xFF1F1926),
                      ),
                    ),
                    SizedBox(
                      height: 6.29 * MediaQuery.of(context).size.height / 100,
                    ),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                      controller: emailController,
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
                        suffix: emailController.text.isNotEmpty
                            ? null
                            : Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: const Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                      ),
                      style: const TextStyle(color: Color(0xFF1F1926)),
                      keyboardType: TextInputType.emailAddress,
                    )
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 0.5 *
                                  73 *
                                  MediaQuery.of(context).size.width /
                                  100,
                              child: TextField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF9F5FF),
                                  hintText: 'First Name',
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
                           suffix: firstNameController.text.isNotEmpty
                            ? null
                            : Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: const Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                                ),
                                style: const TextStyle(color: Color(0xFF1F1926)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              width: 0.5 *
                                  73 *
                                  MediaQuery.of(context).size.width /
                                  100,
                              child: TextField(
                                controller: lastNameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF9F5FF),
                                  hintText: 'Last Name',
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
                           suffix: lastNameController.text.isNotEmpty
                            ? null
                            : Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: const Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                                ),
                                style: const TextStyle(color: Color(0xFF1F1926)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                        controller: gradeController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF9F5FF),
                          hintText: 'Grade',
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
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF9F5FF),
                          hintText: 'Phone Number',
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
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                        controller: passwordController,
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
                           suffix: passwordController.text.isNotEmpty
                            ? null
                            : Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: const Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                        ),
                        style: const TextStyle(color: Color(0xFF1F1926)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF9F5FF),
                          hintText: 'Confirm Password',
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
                         suffix: confirmPasswordController.text.isNotEmpty
                            ? null
                            : Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: const Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              ),  
                        ),
                        style: const TextStyle(color: Color(0xFF1F1926)),
                      ),
                    ),
                    SizedBox(
                      height: 3 * MediaQuery.of(context).size.height / 100,
                    ),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      height: 49,
                      child: ElevatedButton(
                        onPressed: () async {
                                      
                                        if (_validateForm(context)) {
                                          
                                          String email = emailController.text;
                                          String password = passwordController.text;
                                          String firstName = firstNameController.text;
                                          String lastName = lastNameController.text;
                                          registerWithEmailAndPassword(
                                                context, email, password, firstName, lastName);
                                            _progressDialog.hide();
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => const SignIn(),
                                            ));
                                        }
                                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7B31F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3 * MediaQuery.of(context).size.height / 100,
                    ),
                    SizedBox(
                      width: 205,
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style:
                              const TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
                          children: [
                            TextSpan(
                              text: "Sign In",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF7B31F4),
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const SignIn()));
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

  bool _validateForm(BuildContext context) {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty) {
      _showErrorPopup(context, 'Please fill in all required fields.');
      return false;
    }
    else{if(confirmPasswordController.text != passwordController.text){_showErrorPopup(context, 'Please check your password');}}

    return true;
  }

  void _showErrorPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
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

  void _showSuccessPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
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

  Future<void> registerWithEmailAndPassword(BuildContext context, String email,
      String password, String firstName, String lastName) async {
    bool isFirebaseUserCreated = false;

    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }

      final UserCredential authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = authResult.user;
      String displayName = "$firstName $lastName";
      await user?.updateDisplayName(displayName);
      if (user != null) {
        const String apiUrl = APIUrls.userscoresURL;
        final Map<String, dynamic> userData = {
          "uid": user.uid,
        };
        final Dio dio = Dio();
        final Response response = await dio.post(
          apiUrl,
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
          data: jsonEncode(userData),
        );

        if (response.statusCode == 201) {
          isFirebaseUserCreated = true;
          _showSuccessPopup(context, 'User created successfully.');
        } else {
          _showErrorPopup(context,
              'Failed to create user on server. Status code: ${response.statusCode}');
        }
      }
    } on FirebaseAuthException catch (firebaseException) {
      _showErrorPopup(context, 'Firebase Exception: $firebaseException');
    // ignore: deprecated_member_use
    } on DioError catch (dioError) {
      if (!isFirebaseUserCreated) {
        final User? currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          await currentUser.delete();
        }
      }
      _showErrorPopup(context, 'Dio Exception: $dioError');
    } catch (e) {


      _showErrorPopup(context, 'Failed to create user. Exception: $e');
    }
  }
}
