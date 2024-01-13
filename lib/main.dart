import 'package:flutter/material.dart';

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
          SignIn(),
        ]),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
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
                left: 0,
                top: 0,
                child: Container(
                  width: 393,
                  height: 48,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 393, height: 48),
                      SizedBox(
                        width: 49.56,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '09:4',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.91,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 0.80,
                                ),
                              ),
                              TextSpan(
                                text: '6',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.91,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 71.26,
                        height: 12.52,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 45.74,
                              top: 0.33,
                              child: Container(
                                width: 24.18,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 21.86,
                                        height: 11.26,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 1, color: Colors.white),
                                            borderRadius: BorderRadius.circular(2.65),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 23.78,
                              top: 0.35,
                              child: Container(
                                width: 16.01,
                                height: 11.44,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://via.placeholder.com/16x11"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0.70,
                              top: 0.70,
                              child: Container(
                                width: 17.82,
                                height: 11.13,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://via.placeholder.com/18x11"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 47.89,
                              top: 2.26,
                              child: Container(
                                width: 13,
                                height: 7,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF239610),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.33),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 45,
                top: 600,
                child: Container(
                  width: 300,
                  height: 49,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 300,
                          height: 49,
                          decoration: ShapeDecoration(
                            color: Color(0xFF562BB1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 124.91,
                        top: 15,
                        child: SizedBox(
                          width: 50.17,
                          child: Text(
                            'Sign in',
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -108,
                top: 417,
                child: Container(
                  height: 140,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 160.92,
                        top: 0,
                        child: Container(
                          width: 287.08,
                          height: 116,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 287.08,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF8F8F8),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 63,
                                child: Container(
                                  width: 287.08,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF8F8F8),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 21.85,
                                top: 18,
                                child: SizedBox(
                                  width: 35.76,
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Color(0xFF5F5F5F),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 21.85,
                                top: 81,
                                child: SizedBox(
                                  width: 64.57,
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                      color: Color(0xFF5F5F5F),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 125,
                        child: Container(
                          width: 448,
                          height: 15,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 287.08,
                                  height: 15,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: SizedBox(
                                          width: 287.08,
                                          child: Text(
                                            'keep me signed in',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xFF5F5F5F),
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 160.92,
                                top: 0,
                                child: SizedBox(
                                  width: 287.08,
                                  child: Text(
                                    'Forgot Your Password?',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF5F5F5F),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                      height: 0,
                                    ),
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
                left: 65,
                top: 683,
                child: Container(
                  width: 272,
                  height: 69,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 272,
                          height: 17,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFF5F5F5F),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
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
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFF5F5F5F),
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
                        left: 84,
                        top: 27,
                        child: Container(
                          width: 95,
                          height: 42,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  padding: const EdgeInsets.all(6),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x1E000000),
                                        blurRadius: 12,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Stack(children: [
                                        
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 53,
                                top: 0,
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  padding: const EdgeInsets.all(6),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x1E000000),
                                        blurRadius: 12,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        padding: const EdgeInsets.only(
                                          top: 3.75,
                                          left: 9.16,
                                          right: 9.17,
                                          bottom: 3.75,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                          
                                          ],
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 95,
                top: 802,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have an account.',
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
                        style: TextStyle(
                          color: Color(0xFF572CB2),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400 ,
                          decoration: TextDecoration.underline,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 148,
                top: 349,
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
            ],
          ),
        ),
      ],
    );
  }
}