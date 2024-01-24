import 'package:app_0/Home.dart';
import 'package:app_0/SignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                  SizedBox(height: 6.29 * MediaQuery.of(context).size.height / 100),

                  // Email TextField
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: TextField(
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
                      style: TextStyle(color: Colors.black), // Adjust text color
                    ),
                  ),
                  SizedBox(height: 8),

                  // Password TextField
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: TextField(
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
                      style: TextStyle(color: Colors.black), // Adjust text color
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
                  SizedBox(height: 6.29 * MediaQuery.of(context).size.height / 100),

                  // Sign In Button
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    height: 49,
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool('keepSignedIn', keepSignedIn);

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => keepSignedIn ? Home() : SignIn(),
                        ));
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

                   SizedBox(height: 6.29 * MediaQuery.of(context).size.height / 100),

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
                        SizedBox(width: 10), // Adjust the space between rectangles
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
                      style: TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
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
