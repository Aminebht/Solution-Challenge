// ignore_for_file: file_names

import 'package:EducationALL/OneQuestion.dart';
import 'package:EducationALL/Questions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChooseForm extends StatelessWidget {
  final int selectedChoice;
  late int savedChoice;
  int? selectedOption; // New variable to store the selected option

  ChooseForm({super.key, required this.selectedChoice}) {
    savedChoice = selectedChoice;
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7B31F4),Color(0xFFFEF6FF)],
            stops: [0.5, 0.5],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/back.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleIndicator(),
                    SizedBox(width: 8.0),
                    CircleIndicator(),
                    SizedBox(width: 8.0),
                    CircleIndicator(isPink: true),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Choose a Subject',
                    style: TextStyle(
                      color: Color(0xFFFEF6FF),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFFFEF6FF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        RadioSelectGrid(
                          onOptionSelected: (option) {
                            selectedOption = option;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (selectedOption != null) {
                                
                                if (selectedOption == 0) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OneQuestion(
                                        selectedChoice: selectedChoice),
                                  ));
                                } else if (selectedOption == 1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Questions(
                                        selectedChoice: selectedChoice,
                                        lnew: 0),
                                  ));
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFFFEF6FF),
                              backgroundColor: const Color(0xFF843AFD),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 24.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
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
    );
  }
}



class RadioSelectGrid extends StatefulWidget {
  final Function(int)? onOptionSelected;

  const RadioSelectGrid({super.key, this.onOptionSelected});

  @override
  // ignore: library_private_types_in_public_api
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
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04;

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  widget.onOptionSelected?.call(
                      index); 
                });
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: selectedChoice == index
                      ? const Color.fromRGBO(247, 138, 177, 1.0)
                      : const Color.fromRGBO(229, 212, 255, 1.0),
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
                          color: const Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            customImages[index],
                            style: TextStyle(
                              color: selectedChoice == index
                                  ? const Color(0xFFFEF6FF)
                                  : const Color(0xFF843AFD),
                              fontSize: fontSize + 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        customTexts[index],
                        style: TextStyle(
                          color: selectedChoice == index
                              ? const Color(0xFFFEF6FF)
                              : const Color(0xFF843AFD),
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
        color: isPink ? const Color.fromRGBO(247, 138, 177, 1.0) : const Color(0xFFFEF6FF),
      ),
    );
  }
}