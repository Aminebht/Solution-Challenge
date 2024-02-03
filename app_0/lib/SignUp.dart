import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:app_0/SignIn.dart';

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
                        color: Colors.black,
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
                          fillColor: const Color(0xFFF8F8F8),
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: const Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                      ),
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
                                  fillColor: const Color(0xFFF8F8F8),
                                  hintText: 'First Name',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF5F5F5F),
                                    fontSize: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: const Color(0xB2B2B2).withOpacity(0.25),
                                    ),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.black),
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
                                  fillColor: const Color(0xFFF8F8F8),
                                  hintText: 'Last Name',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF5F5F5F),
                                    fontSize: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: const Color(0xB2B2B2).withOpacity(0.25),
                                    ),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.black),
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
                          fillColor: const Color(0xFFF8F8F8),
                          hintText: 'Grade',
                          hintStyle: const TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: const Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 73 * MediaQuery.of(context).size.width / 100,
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF8F8F8),
                          hintText: 'Phone Number',
                          hintStyle: const TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: const Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
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
                          fillColor: const Color(0xFFF8F8F8),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: const Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
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
                          fillColor: const Color(0xFFF8F8F8),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: const Color(0xB2B2B2).withOpacity(0.25),
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
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

                            // Call the registration function with email and password
                            registerWithEmailAndPassword(
                                context, email, password);

                            // Navigate or perform other actions...
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignIn()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF572CB2),
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
                      width: 203,
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style:
                              const TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF572CB2),
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
        confirmPasswordController.text.isEmpty) {
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

  Future<void> registerWithEmailAndPassword(
      BuildContext context, String email, String password) async {
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
      if (user != null) {
        // Replace 'https://your-api-endpoint.com/create_user' with your actual API endpoint
        const String apiUrl = 'http://10.0.2.2:8000/api/user/scores/';

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
          // ignore: use_build_context_synchronously
          _showSuccessPopup(context, 'User created successfully.');
        } else {
          print(
              "Failed to create user on server. Status code: ${response.statusCode}");

          // Show an error popup
          // ignore: use_build_context_synchronously
          _showErrorPopup(context,
              'Failed to create user on server. Status code: ${response.statusCode}');
        }
      }
    } on FirebaseAuthException catch (firebaseException) {
      // Handle Firebase Authentication exceptions
      print("Firebase Exception: $firebaseException");
      // ignore: use_build_context_synchronously
      _showErrorPopup(context, 'Firebase Exception: $firebaseException');
    // ignore: deprecated_member_use
    } on DioError catch (dioError) {
      // Handle Dio exceptions (Django server request)
      print("Dio Exception: $dioError");
      if (!isFirebaseUserCreated) {
        final User? currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          await currentUser.delete();
        }
      }
      // ignore: use_build_context_synchronously
      _showErrorPopup(context, 'Dio Exception: $dioError');
    } catch (e) {
      print("Exception during registration: $e");

      // Handle the case where user creation failed for both Firebase and Django
      // ignore: use_build_context_synchronously
      _showErrorPopup(context, 'Failed to create user. Exception: $e');
    } finally {
      // If there's an error in Django and Firebase user was created, delete the Firebase user
    }
  }
}
