import 'package:app_0/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}

class SignUp extends StatelessWidget {
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
            top: MediaQuery.of(context).size.height * 0.21,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sign Up text
                  Text(
                    'Sign Up',
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

                  // First Name and Last Name text fields in the same row
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: Row(
                      children: [
                        // First Name TextField
                        Expanded(
                          child: SizedBox(
                            width: 0.5 * 73 * MediaQuery.of(context).size.width / 100,
                            child: TextField(
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
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        // Last Name TextField
                        Expanded(
                          child: SizedBox(
                            width: 0.5 * 73 * MediaQuery.of(context).size.width / 100,
                            child: TextField(
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),

                  // Grade TextField
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: TextField(
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
                    ),
                  ),
                  SizedBox(height: 8),

                  // Phone Number TextField
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: TextField(
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
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Confirm Password TextField
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    child: TextField(
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
                    ),
                  ),

                  SizedBox(height: 3 * MediaQuery.of(context).size.height / 100),

                  // Sign Up Button
                  SizedBox(
                    width: 73 * MediaQuery.of(context).size.width / 100,
                    height: 49,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ));
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

                  // Additional UI elements
                  SizedBox(height: 3 * MediaQuery.of(context).size.height / 100),

                  // Already have an account? Login
                  SizedBox(
                    width: 203,
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
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
                                  builder: (context) => SignIn(),
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
