import 'package:app_0/Home.dart';
import 'package:app_0/SignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool keepSignedIn = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image covering 33% of the screen height
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
            top: MediaQuery.of(context).size.height * 0.33,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sign In text
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black, // Adjust text color
                    ),
                  ),
                  SizedBox(
                      height: 6.29 * MediaQuery.of(context).size.height / 100),

                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: TextFormField(
                      controller: _emailController, // Pass the controller here
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
                    ),
                  ),
                  SizedBox(height: 8),

                  // Password TextField
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: TextFormField(
                      controller:
                          _passwordController, // Pass the controller here
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
                    ),
                  ),

                  // Additional UI elements
                  SizedBox(height: 8),
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: Row(
                      children: [
                        // Left side - Checkbox and text
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Keep me signed in',
                          style: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        // Right side - Forgot Your Password?
                        InkWell(
                          onTap: () {
                            // Add your logic for forgot password
                          },
                          child: Text(
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

                  // Additional UI elements
                  SizedBox(
                      height: 6.29 * MediaQuery.of(context).size.height / 100),

                  // Sign In Button
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    height: 49,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Get email and password from text fields
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        // Perform sign-in and check the result
                        bool signInSuccess =
                            await signInWithEmailAndPassword(email, password);

                        // If sign-in is successful, navigate to the home page
                        if (signInSuccess) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('keepSignedIn', keepSignedIn);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                        } else {
                          // Show a popup/dialog for sign-in failure
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Sign-in Failed'),
                                content: Text('Check your email and password.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF572CB2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 6.29 * MediaQuery.of(context).size.height / 100),

                  // New row with 'or' and horizontal lines
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: Row(
                      children: [
                        // Left line
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Color(0xFF5F5F5F),
                          ),
                        ),
                        SizedBox(width: 8),
                        // 'or' text
                        Text(
                          'Or',
                          style: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 8),
                        // Right line
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Color(0xFF5F5F5F),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),

                  // Additional UI elements
                  SizedBox(height: 8),

                  // New row with images
                  SizedBox(
                    width: 95, // Set the width to 95 pixels
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Left rectangle with Google image
                        Container(
                          width: 42,
                          height: 42,
                          color: Colors.white,
                          child: Center(
                            child: Image.asset(
                              'images/google.png',
                              width: 24, // Adjust the width of the image
                              height: 24, // Adjust the height of the image
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 10), // Adjust the space between rectangles
                        // Right rectangle with Facebook image
                        Container(
                          width: 42,
                          height: 42,
                          color: Colors.white,
                          child: Center(
                            child: Image.asset(
                              'images/fb.png',
                              width: 24, // Adjust the width of the image
                              height: 24, // Adjust the height of the image
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 203, //
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF572CB2),
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
    );
  }
}

Future<bool> signInWithEmailAndPassword(String email, String password) async {
  try {
    print('login');
    print(email);
    print(password);

    await Firebase.initializeApp();
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(isUserSignedIn());

    // If there is a user in the UserCredential, consider it a successful sign-in
    return userCredential.user != null;
  } catch (e) {
    print(e.toString());
    // Sign-in failed, return false
    return false;
  }
}

bool isUserSignedIn() {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}
