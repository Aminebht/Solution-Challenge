import 'package:app_0/OneQuestion.dart';
import 'package:app_0/chooselesson.dart';
import 'package:app_0/Questions.dart';
import 'package:flutter/material.dart';

class ChooseForm extends StatelessWidget {
  @override
  int selectedChoice = -1;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(123, 49, 244, 1.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                   Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChooseLesson(),
                                ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                       
                        child: Image.asset(
                          'images/back.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleIndicator(),
                      SizedBox(width: 8.0),
                      CircleIndicator(),
                      SizedBox(width: 8.0),
                      CircleIndicator(isPink: true),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Choose a Subject',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          RadioSelectGrid(
  onChoiceSelected: (choice) {
    selectedChoice = choice;
  },
),

                          SizedBox(height: 16.0),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child:  ElevatedButton(
      onPressed: () {
        if (selectedChoice == 0) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OneQuestion(),
          ));
        } else if (selectedChoice == 1) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Questions(),
          ));
        }
      },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(123, 49, 244, 1.0),
                                onPrimary: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 24.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 18.0,
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
        ),
      ),
    );
  }
}


class RadioSelectGrid extends StatefulWidget {
  final Function(int) onChoiceSelected;

  const RadioSelectGrid({Key? key, required this.onChoiceSelected})
      : super(key: key);

  @override
  _RadioSelectGridState createState() => _RadioSelectGridState();
}


class _RadioSelectGridState extends State<RadioSelectGrid> {
  int selectedChoice = -1;

  List<String> customTexts = [
    'Quick Exercise',
    'A Set',
  ];

  List<String> customImages = [
    '1',
    '6',
  ]; // Replace images with characters '1' and '6'

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04;

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 25.0,
            crossAxisSpacing: 25.0,
            childAspectRatio: 1.20,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedChoice = index;
                   widget.onChoiceSelected(selectedChoice);
                });
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: selectedChoice == index
                      ? Color.fromRGBO(247, 138, 177, 1.0)
                      : Color.fromRGBO(229, 212, 255, 1.0),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            customImages[index],
                            style: TextStyle(
                              color: selectedChoice == index
                                  ? Colors.white
                                  : Color.fromRGBO(123, 49, 244, 1.0),
                              fontSize: fontSize + 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        customTexts[index],
                        style: TextStyle(
                          color: selectedChoice == index
                              ? Colors.white
                              : Color.fromRGBO(123, 49, 244, 1.0),
                          fontSize: fontSize + 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CircleIndicator extends StatelessWidget {
  final bool isPink;

  const CircleIndicator({Key? key, this.isPink = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isPink ? Color.fromRGBO(247, 138, 177, 1.0) : Colors.white,
      ),
    );
  }
}
