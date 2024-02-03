import 'package:app_0/ChooseSubject.dart';
import 'package:app_0/Profile.dart';
import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Home Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }

class Home1 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home1> {
  int _currentIndex = 0;
  List<Widget> pages = [Profile(), Profile(), Profile()];
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
            top: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's Get Started",
                    style: TextStyle(
                      color: Colors.black,
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
                            builder: (context) => ChooseSubject(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF7B31F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.07 * MediaQuery.of(context).size.height),
                  SizedBox(
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
                          color: Color(0xFF7B31F4).withOpacity(0.5),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        QuizItem(
                          title: 'Title 1',
                          imageUrl: 'https://example.com/your_image_url1.png',
                          subtitle: 'Subtitle 1',
                        ),
                        QuizItem(
                          title: 'Title 2',
                          imageUrl: 'https://example.com/your_image_url2.png',
                          subtitle: 'Subtitle 2',
                        ),
                        QuizItem(
                          title: 'Title 2',
                          imageUrl: 'https://example.com/your_image_url2.png',
                          subtitle: 'Subtitle 2',
                        ),
                        QuizItem(
                          title: 'Title 2',
                          imageUrl: 'https://example.com/your_image_url2.png',
                          subtitle: 'Subtitle 2',
                        ),
                        QuizItem(
                          title: 'Title 2',
                          imageUrl: 'https://example.com/your_image_url2.png',
                          subtitle: 'Subtitle 2',
                        ),
                        QuizItem(
                          title: 'Title 2',
                          imageUrl: 'https://example.com/your_image_url2.png',
                          subtitle: 'Subtitle 2',
                        ),
                        QuizItem(
                          title: 'Title 2',
                          imageUrl: 'https://example.com/your_image_url2.png',
                          subtitle: 'Subtitle 2',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE5D4FF), width: 1.0),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF572CB2),
            unselectedItemColor: Color(0xFF572CB2).withOpacity(0.52),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                print(index);
                _currentIndex = index;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => pages[index],
                  ),
                );
              });
            },
            items: [
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
    );
  }
}

// class ChooseSubject extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose Subject'),
//       ),
//       body: Center(
//         child: Text('Choose your subject here!'),
//       ),
//     );
//   }
// }

class QuizItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String subtitle;

  QuizItem(
      {required this.title, required this.imageUrl, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      decoration: BoxDecoration(
        color: Color(0xFFE5D4FF),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF572CB2),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              color: Color(0xFF7B31F4).withOpacity(0.5),
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
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              color: Color(0xFF572CB2),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
