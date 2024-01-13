import 'package:flutter/material.dart';
import 'SignIn.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          SignUp(),
        ]),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 56,
                top: 238,
                child: Container(
                  width: 292,
                  height: 588,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 292,
                                  height: 536,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Sign Up',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 28,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                        width: 289,
                                                        height: 53,
                                                        padding: const EdgeInsets.all(16),
                                                        decoration: ShapeDecoration(
                                                          color: Color(0xFFF8F8F8),
                                                          shape: RoundedRectangleBorder(
                                                            side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                                            borderRadius: BorderRadius.circular(16),
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          style: TextStyle(
                                                            color: Color(0xFF5F5F5F),
                                                            fontSize: 14,
                                                            fontFamily: 'Inter',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: 'Email', // Placeholder text
                                                            hintStyle: TextStyle(
                                                              color: Color(0xFF5F5F5F),
                                                              fontSize: 14,
                                                              fontFamily: 'Inter',
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                            border: InputBorder.none, // Remove the border
                                                          ),
                                                        ),
                                                      ),


                                            const SizedBox(height: 15),
                                            Container(
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                                      height: 53,
                                                                      padding: const EdgeInsets.all(16),
                                                                      decoration: ShapeDecoration(
                                                                        color: Color(0xFFF8F8F8),
                                                                        shape: RoundedRectangleBorder(
                                                                          side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                                                          borderRadius: BorderRadius.circular(16),
                                                                        ),
                                                                      ),
                                                                      child: TextField(
                                                                        style: TextStyle(
                                                                          color: Color(0xFF5F5F5F),
                                                                          fontSize: 14,
                                                                          fontFamily: 'Inter',
                                                                          fontWeight: FontWeight.w400,
                                                                        ),
                                                                        decoration: InputDecoration(
                                                                          hintText: 'First Name', // Placeholder text
                                                                          hintStyle: TextStyle(
                                                                            color: Color(0xFF5F5F5F),
                                                                            fontSize: 14,
                                                                            fontFamily: 'Inter',
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                          border: InputBorder.none, // Remove the border
                                                                        ),
                                                                      ),
                                                                    ),

                                                  ),
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                    child: Container(
                                                              height: 53,
                                                              padding: const EdgeInsets.all(16),
                                                              decoration: ShapeDecoration(
                                                                color: Color(0xFFF8F8F8),
                                                                shape: RoundedRectangleBorder(
                                                                  side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                                                  borderRadius: BorderRadius.circular(16),
                                                                ),
                                                              ),
                                                              child: TextField(
                                                                style: TextStyle(
                                                                  color: Color(0xFF5F5F5F),
                                                                  fontSize: 14,
                                                                  fontFamily: 'Inter',
                                                                  fontWeight: FontWeight.w400,
                                                                ),
                                                                decoration: InputDecoration(
                                                                  hintText: 'Last Name', // Placeholder text
                                                                  hintStyle: TextStyle(
                                                                    color: Color(0xFF5F5F5F),
                                                                    fontSize: 14,
                                                                    fontFamily: 'Inter',
                                                                    fontWeight: FontWeight.w400,
                                                                  ),
                                                                  border: InputBorder.none, // Remove the border
                                                                ),
                                                              ),
                                                            ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            Container(
                                                      width: 289,
                                                      height: 53,
                                                      padding: const EdgeInsets.all(16),
                                                      decoration: ShapeDecoration(
                                                        color: Color(0xFFF8F8F8),
                                                        shape: RoundedRectangleBorder(
                                                          side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                                          borderRadius: BorderRadius.circular(16),
                                                        ),
                                                      ),
                                                      child: TextField(
                                                        style: TextStyle(
                                                          color: Color(0xFF5F5F5F),
                                                          fontSize: 14,
                                                          fontFamily: 'Inter',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                        decoration: InputDecoration(
                                                          hintText: 'Grade', // Placeholder text
                                                          hintStyle: TextStyle(
                                                            color: Color(0xFF5F5F5F),
                                                            fontSize: 14,
                                                            fontFamily: 'Inter',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                          border: InputBorder.none, // Remove the border
                                                        ),
                                                      ),
                                                    ),

                                            const SizedBox(height: 15),
                                            Container(
                                                    width: 289,
                                                    height: 53,
                                                    padding: const EdgeInsets.all(16),
                                                    decoration: ShapeDecoration(
                                                      color: Color(0xFFF8F8F8),
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                                        borderRadius: BorderRadius.circular(16),
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      style: TextStyle(
                                                        color: Color(0xFF5F5F5F),
                                                        fontSize: 14,
                                                        fontFamily: 'Inter',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      decoration: InputDecoration(
                                                        hintText: 'Phone number', // Placeholder text
                                                        hintStyle: TextStyle(
                                                          color: Color(0xFF5F5F5F),
                                                          fontSize: 14,
                                                          fontFamily: 'Inter',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                        border: InputBorder.none, // Remove the border
                                                      ),
                                                    ),
                                                  ),

                                            const SizedBox(height: 15),
                                            Container(
                                                        width: 289,
                                                        height: 53,
                                                        padding: const EdgeInsets.all(16),
                                                        decoration: ShapeDecoration(
                                                          color: Color(0xFFF8F8F8),
                                                          shape: RoundedRectangleBorder(
                                                            side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                                            borderRadius: BorderRadius.circular(16),
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          obscureText: true, // Set this to true to hide the entered text for password fields
                                                          style: TextStyle(
                                                            color: Color(0xFF5F5F5F),
                                                            fontSize: 14,
                                                            fontFamily: 'Inter',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: 'Password', // Placeholder text
                                                            hintStyle: TextStyle(
                                                              color: Color(0xFF5F5F5F),
                                                              fontSize: 14,
                                                              fontFamily: 'Inter',
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                            border: InputBorder.none, // Remove the border
                                                          ),
                                                        ),
                                                      ),

                                            const SizedBox(height: 15),
                                            Container(
                                                        width: 289,
                                                        height: 53,
                                                        padding: const EdgeInsets.all(16),
                                                        decoration: ShapeDecoration(
                                                          color: Color(0xFFF8F8F8),
                                                          shape: RoundedRectangleBorder(
                                                            side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                                            borderRadius: BorderRadius.circular(16),
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          obscureText: true, // Set this to true to hide the entered text for password fields
                                                          style: TextStyle(
                                                            color: Color(0xFF5F5F5F),
                                                            fontSize: 14,
                                                            fontFamily: 'Inter',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: 'Confirm Password', // Placeholder text
                                                            hintStyle: TextStyle(
                                                              color: Color(0xFF5F5F5F),
                                                              fontSize: 14,
                                                              fontFamily: 'Inter',
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                            border: InputBorder.none, // Remove the border
                                                          ),
                                                        ),
                                                      ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                      ElevatedButton(
  onPressed: () {
    // Navigate to the SignIn page
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignIn(),
    ));
  },
  style: ElevatedButton.styleFrom(
    primary: Color(0xFF572CB2), // Background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: Container(
    width: 292,
    height: 45,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Center(
      child: Text(
        'Next',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    ),
  ),
),

                                    ],
                                  ),
                                ),
                              ),
                             Positioned(
                                                        left: 44,
                                                        top: 571,
                                                        child: RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'Already have an account.',
                                                                style: TextStyle(
                                                                  color: Color(0xFF5F5F5F),
                                                                  fontSize: 14,
                                                                  fontFamily: 'Inter',
                                                                  fontWeight: FontWeight.w400,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 'Login',
                                                                style: TextStyle(
                                                                  color: Color(0xFF572CB2),
                                                                  fontSize: 14,
                                                                  fontFamily: 'Inter',
                                                                  fontWeight: FontWeight.w400,
                                                                  decoration: TextDecoration.underline,
                                                                  height: 0,
                                                                ),
                                                                recognizer: TapGestureRecognizer()
                                                                  ..onTap = () {
                                                                    // Navigate to the SignIn page
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
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                                      width: 393,
                                      height: 284,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/sign_bg.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}