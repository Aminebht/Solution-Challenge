import 'package:app_0/api_urls.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:app_0/SignIn.dart';
import 'package:app_0/my_data.dart';
import 'package:app_0/my_data_adapter.dart';
import 'package:hive/hive.dart';

class SignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
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
                    Text(
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
                          fillColor: Color(0xFFF9F5FF),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: TextStyle(color: Color(0xFF1F1926)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 8),
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
                                  fillColor: Color(0xFFF9F5FF),
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF5F5F5F),
                                    fontSize: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Color(0xB2B2B2).withOpacity(0.25),
                                    ),
                                  ),
                                ),
                                style: TextStyle(color: Color(0xFF1F1926)),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
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
                                  fillColor: Color(0xFFF9F5FF),
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF5F5F5F),
                                    fontSize: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Color(0xB2B2B2).withOpacity(0.25),
                                    ),
                                  ),
                                ),
                                style: TextStyle(color: Color(0xFF1F1926)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                        controller: gradeController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF9F5FF),
                          hintText: 'Grade',
                          hintStyle: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: TextStyle(color: Color(0xFF1F1926)),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF9F5FF),
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: TextStyle(color: Color(0xFF1F1926)),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF9F5FF),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: TextStyle(color: Color(0xFF1F1926)),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF9F5FF),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: TextStyle(color: Color(0xFF1F1926)),
                      ),
                    ),
                    SizedBox(
                      height: 3 * MediaQuery.of(context).size.height / 100,
                    ),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      height: 49,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate form
                          if (_validateForm(context)) {
                            // Get values from text fields
                            String email = emailController.text;
                            String password = passwordController.text;
                            String firstName = firstNameController.text;
                            String lastName = lastNameController.text;

                            // Call the registration function with email and password
                            registerWithEmailAndPassword(
                                context, email, password, firstName, lastName);

                            // Navigate or perform other actions...
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignIn()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF7B31F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
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
                      width: 203,
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF7B31F4),
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignIn()));
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
    // Add validation logic for required fields
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty) {
      // Show an error message or handle it as needed
      _showErrorPopup(context, 'Please fill in all required fields.');
      return false;
    }

    // You can add more validation logic if necessary (e.g., email format, password strength)

    return true;
  }

  void _showErrorPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
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
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
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
      print('registration');

      // Initialize Firebase if not initialized
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }

      // Create user in Firebase Authentication
      final UserCredential authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If Firebase registration is successful, send user data to your server
      final User? user = authResult.user;
      String displayName = firstName + " " + lastName;
      await user?.updateDisplayName(displayName);

      print('User registration successful with display name: $displayName');

      if (user != null) {
        // Replace 'https://your-api-endpoint.com/create_user' with your actual API endpoint
        final String apiUrl = '${APIUrls.userscoresURL}';
        //final String apiUrl = 'http://127.0.0.1:8000/api/user/scores/';

        // Replace this with the actual data you want to send to your server
        final Map<String, dynamic> userData = {
          "uid": user.uid,
          // ... other user data
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
          // If the server operation is successful, proceed to local data storage

          // Set the flag to indicate that Firebase user creation was successful
          isFirebaseUserCreated = true;

          // Show a success popup
          _showSuccessPopup(context, 'User created successfully.');
        } else {
          print(
              "Failed to create user on server. Status code: ${response.statusCode}");

          // Show an error popup
          _showErrorPopup(context,
              'Failed to create user on server. Status code: ${response.statusCode}');
        }
      }
    } on FirebaseAuthException catch (firebaseException) {
      // Handle Firebase Authentication exceptions
      print("Firebase Exception: $firebaseException");
      _showErrorPopup(context, 'Firebase Exception: $firebaseException');
    } on DioError catch (dioError) {
      // Handle Dio exceptions (Django server request)
      print("Dio Exception: $dioError");
      if (!isFirebaseUserCreated) {
        final User? currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          await currentUser.delete();
        }
      }
      _showErrorPopup(context, 'Dio Exception: $dioError');
    } catch (e) {
      print("Exception during registration: $e");

      // Handle the case where user creation failed for both Firebase and Django
      _showErrorPopup(context, 'Failed to create user. Exception: $e');
    } finally {
      // If there's an error in Django and Firebase user was created, delete the Firebase user
    }
  }
}
