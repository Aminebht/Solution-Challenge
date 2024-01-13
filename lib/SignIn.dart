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
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 393,
                  height: 284,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Container(
                                      width: 393,
                                      height: 284,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/sign_bg.png"),
                                          fit: BoxFit.fill,
                                        ),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                            const Positioned(
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x1E000000),
                                              blurRadius: 12,
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                      child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/google.png"),

                                        ),
                                      ),
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
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x1E000000),
                                              blurRadius: 12,
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: Container(
                                      width: 11.67,
                                      height: 22.5,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/fb.png"),
                                        ),
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 95,
                top: 802,
                child: Container(
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
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
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                height: 0,
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
                left: -108,
                top: 349,
                child: Container(
                  width: 448,
                  height: 208,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 68,
                        child: Container(
                          width: 448,
                          height: 140,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: double.infinity,
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
                                                    color: const Color(0xFFF8F8F8),
                                                    shape: RoundedRectangleBorder(
                                                      side: const BorderSide(width: 1, color: Color(0x3FB2B2B2)),
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
                                                    color: const Color(0xFFF8F8F8),
                                                    shape: RoundedRectangleBorder(
                                                      side: const BorderSide(width: 1, color: Color(0x3FB2B2B2)),
                                                      borderRadius: BorderRadius.circular(16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Positioned(
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
                                              const Positioned(
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
                                                  child: const Stack(
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
                                              const Positioned(
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
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 256,
                        top: 0,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}