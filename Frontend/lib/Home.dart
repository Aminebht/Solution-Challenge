// ignore_for_file: file_names

import 'package:EducationALL/ChooseSubject.dart';
import 'package:EducationALL/Profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<String> lasts = ['Math', 'Robotics', 'Math', 'History'];
  List<String> subtitles = ['Gain', 'Lesson', 'Probability', 'Time'];

  List<Widget> pages = [const Home(),Profile(), Profile()];
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
              top: 240,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Let's Get Started",
                      style: TextStyle(
                        color: Color(0xFF1F1926),
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
                    SizedBox(
                      width: 0.73 * MediaQuery.of(context).size.width,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ChooseSubject(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7B31F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Start',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.07 * MediaQuery.of(context).size.height),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Last Quiz',
                          style: TextStyle(
                            color: Color(0xFF572CB2),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Show all',
                          style: TextStyle(
                            color: const Color(0xFF7B31F4).withOpacity(0.5),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            lasts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return QuizItem(
                            title: lasts[index],
                            imageUrl:
                                'https://example.com/your_image_url$index.png',
                            subtitle: subtitles[index],
                            onTap: () {
                              /*not completed yet*/
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE5D4FF), width: 1.0),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: BottomNavigationBar(
  backgroundColor: Colors.white,
  selectedItemColor: const Color(0xFF572CB2),
  unselectedItemColor: const Color(0xFF572CB2).withOpacity(0.52),
  showSelectedLabels: true,
  showUnselectedLabels: true,
  type: BottomNavigationBarType.fixed,
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
    Future.delayed(Duration.zero, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pages[index],
        ),
      );
    });
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
),

          ),
        ),
      ),
    );
  }
}

class QuizItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String subtitle;
  final VoidCallback onTap;

  const QuizItem(
      {super.key, required this.title,
      required this.imageUrl,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 174,
        decoration: BoxDecoration(
          color: const Color(0xFFE5D4FF),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF572CB2),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 39,
              height: 39,
              decoration: BoxDecoration(
                color: const Color(0xFF7B31F4).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  'images/gain.png',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF572CB2),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
