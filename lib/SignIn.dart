import 'package:app_0/SignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),  // Assuming SignIn is your root widget
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                _buildBackgroundImage(screenWidth, screenHeight),
                _buildSignInForm(screenWidth, screenHeight),
                _buildSignUpLink(screenWidth, screenHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildSignUpLink(double screenWidth, double screenHeight) {
  return Positioned(
    left: 0,
    top: screenHeight * 0.68,
    right: 0,
    child: Builder(
      builder: (context) => Container(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 60), // Add space between images and text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialMediaButton("images/google.png", screenWidth, screenHeight),
                SizedBox(width: 8),
                _buildSocialMediaButton("images/fb.png", screenWidth, screenHeight),
              ],
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Don’t have an account. ',
                    style: TextStyle(
                      color: Color(0xFF5F5F5F),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(
                      color: Color(0xFF572CB2),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      height: 0,
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
          ],
        ),
      ),
    ),
  );
}



  Widget _buildBackgroundImage(double screenWidth, double screenHeight) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.33,
        child: Image.asset(
          "images/sign_bg.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildSignInForm(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.13,
      top: screenHeight * 0.3, // Adjusted top position
      child: Container(
        width: screenWidth * 0.74,
        height: screenHeight * 0.28,
        child: Column( // Changed from Stack to Column
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // Adjusted spacing
            _buildTextField("Email", screenWidth, screenHeight),
            _buildTextField("Password", screenWidth, screenHeight, obscureText: true),
            _buildRememberMeAndForgotPassword(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, double screenWidth, double screenHeight, {bool obscureText = false}) {
    double topPosition = hintText == "Email" ? 0 : screenHeight * 0.1;

    return Positioned(
      left: 0,
      top: topPosition,
      child: Container(
        width: screenWidth * 0.74,
        height: screenHeight * 0.1,
        child: TextField(
          obscureText: obscureText,
          style: const TextStyle(
            color: Color(0xFF5F5F5F),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF5F5F5F),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF5F5F5F),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF572CB2),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeAndForgotPassword(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.1, bottom: screenHeight * 0.1), // Augmenter le padding
      child: Positioned(
        left: 0,
        top: screenHeight * 0.2,
        child: Container(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrer le texte 'Or' et les images
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centrer le texte 'Or'
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xFF5F5F5F),
                      thickness: 1.0,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Or',
                    style: TextStyle(
                      color: Color(0xFF5F5F5F),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Divider(
                      color: Color(0xFF5F5F5F),
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaButton(String imagePath, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.1,
      height: screenHeight * 0.1,
      padding: const EdgeInsets.all(6),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 12,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        width: screenWidth * 0.06,
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
