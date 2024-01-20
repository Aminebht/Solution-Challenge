import 'package:app_0/SignIn.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

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
      body: Stack(
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
                        fillColor: Color(0xFFF8F8F8),
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
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      // Add validation here (e.g., validator: (value) => value.isEmpty ? 'Email is required' : null,)
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
                                fillColor: Color(0xFFF8F8F8),
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
                              style: TextStyle(color: Colors.black),
                              // Add validation here
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
                                fillColor: Color(0xFFF8F8F8),
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
                              style: TextStyle(color: Colors.black),
                              // Add validation here
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
                        fillColor: Color(0xFFF8F8F8),
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
                      style: TextStyle(color: Colors.black),
                      // Add validation here
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: TextField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF8F8F8),
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
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,
                      // Add validation here
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
                        fillColor: Color(0xFFF8F8F8),
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
                      style: TextStyle(color: Colors.black),
                      // Add validation here (e.g., validator: (value) => value.isEmpty ? 'Password is required' : null,)
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
                        fillColor: Color(0xFFF8F8F8),
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
                      style: TextStyle(color: Colors.black),
                      // Add validation here (e.g., validator: (value) => value != passwordController.text ? 'Passwords do not match' : null,)
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
                        if (_validateForm()) {
                          // Get values from text fields
                          String email = emailController.text;
                          String password = passwordController.text;

                          // Call the registration function with email and password
                          registerWithEmailAndPassword(email, password);

                          // Navigate or perform other actions...
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignIn()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF572CB2),
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
                              color: Color(0xFF572CB2),
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignIn()));
                                // Navigate to login screen
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
    );
  }

  bool _validateForm() {
    // Add validation logic for required fields
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      // Show an error message or handle it as needed
      return false;
    }

    // You can add more validation logic if necessary (e.g., email format, password strength)

    return true;
  }
}

// Other functions...

Future<void> registerWithEmailAndPassword(String email, String password) async {
  try {
    print('registration');

    // Initialize Firebase if not initialized
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }

    // Create user in Firebase Authentication
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // If Firebase registration is successful, send user data to your server
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Replace 'https://your-api-endpoint.com/create_user' with your actual API endpoint
      final String apiUrl = 'http://127.0.0.1:8000/api/user/scores/';

      // Replace this with the actual data you want to send to your server
      final Map<String, dynamic> userData = {
        "uid": user.uid,

        // ... other user data
      };

      final Dio dio = Dio();

      final response = await dio.post(
        apiUrl,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        print("User created on server successfully");
      } else {
        print(
            "Failed to create user on server. Status code: ${response.statusCode}");
      }
    }
  } catch (e) {
    print("Exception during registration: $e");
  }
}
