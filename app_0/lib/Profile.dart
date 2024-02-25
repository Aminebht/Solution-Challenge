// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';
import 'package:EducationALL/Home.dart';
import 'package:EducationALL/SignIn.dart';
import 'package:EducationALL/Stats.dart';
import 'package:EducationALL/my_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class ChangeInfoPopup extends StatefulWidget {
  final String name;
  final String email;
  final Function(String) onUpdateName;
  final Function(String) onUpdateEmail;
  final double screenWidth;
  final double screenHeight;

  const ChangeInfoPopup({
    Key? key,
    required this.name,
    required this.email,
    required this.onUpdateName,
    required this.onUpdateEmail,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChangeInfoPopupState createState() =>
      // ignore: no_logic_in_create_state
      _ChangeInfoPopupState(screenWidth, screenHeight);
}

class _ChangeInfoPopupState extends State<ChangeInfoPopup> {
  TextEditingController newNameController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newNumberController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController checkpasswordController = TextEditingController();

  double screenWidth;
  double screenHeight;

  _ChangeInfoPopupState(this.screenWidth, this.screenHeight);

  @override
  Widget build(BuildContext context) {
    double dialogWidth = screenWidth * 0.6;
    double dialogHeight = screenHeight * 0.4;

    return SizedBox(
      width: dialogWidth,
      height: dialogHeight,
      child: AlertDialog(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(widget.name),
        content: Padding(
          padding: const EdgeInsets.all(30), 
          child: SizedBox(
            width: dialogWidth,
            height: dialogHeight,
            child: Column(
              children: [
                if (widget.name == 'My Account')
                  Column(
                    children: [
                      TextField(
                        controller: newNameController,
                        decoration: const InputDecoration(labelText: 'New Name'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: newNumberController,
                        decoration:
                            const InputDecoration(labelText: 'New Phone Number'),
                      ),
                    ],
                  ),
                if (widget.name == 'Change Email Address')
                  TextField(
                    controller: newEmailController,
                    decoration: const InputDecoration(labelText: 'New Email'),
                  ),
                if (widget.name == 'Change Password')
                  Column(
                    children: [
                      TextField(
                        controller: newPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(labelText: 'New Password'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: checkpasswordController,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: 'Confirm Password'),
                      ),
                    ],
                  ),
                if (widget.name == 'Log out')
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              SignIn(),
                        ),
                      );
                    },
                    child: const Text('Log out'),
                  ),
                if (widget.name == 'Your Stats')
                  ElevatedButton(
                    onPressed: () {
                      /* Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Stats(url:_pickedFile.path,name:name),
                        ),
                      );*/
                    },
                    child: const Text('Your Stats'),
                  ),
              ],
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String newName = newNameController.text;
                    String newEmail = newEmailController.text;
                    String newPassword = newPasswordController.text;
                    String checkPassword = checkpasswordController.text;

                    if (widget.name == 'My Account') {
                      widget.onUpdateName(newName);
                    } else if (widget.name == 'Change Email Address') {
                      widget.onUpdateEmail(newEmail);
                    }
                    if (widget.name == 'Change Password') {
                      if (newPassword != checkPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match.'),
                            backgroundColor: Color(0xFF7B31F4),
                          ),
                        );
                        return;
                      }
                    }

                    newNameController.dispose();
                    newNumberController.dispose();
                    newEmailController.dispose();
                    newPasswordController.dispose();
                    checkpasswordController.dispose();

                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xFF7B31F4)),
                    minimumSize: MaterialStateProperty.all<Size>(const Size(150, 48)),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    newNameController.dispose();
                    newNumberController.dispose();
                    newEmailController.dispose();
                    newPasswordController.dispose();
                    checkpasswordController.dispose();

                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xFF7B31F4)),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;

  List<Widget> pages = [const Home(), const Profile(), const Profile()];
  late ImagePicker _imagePicker;
  late File _pickedFile;
  User? user = FirebaseAuth.instance.currentUser;
  // ignore: non_constant_identifier_names
  String Username = 'No Display Name';
  String email = 'Not Signed In';
  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _pickedFile = File('');
    if (user != null) {
      Username = user?.displayName ?? 'No Display Name';
      email = user?.email ?? 'Not Signed In';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE0FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Profile',
                style: TextStyle(
                  color: Color(0xFF1F1926),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 1 * MediaQuery.of(context).size.width,
                height: 93,
                padding:
                    const EdgeInsets.only(left: 40, top: 15, bottom: 15, right: 40),
                decoration: BoxDecoration(
                  color: const Color(0xFF7B31F4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _getImage,
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: const Color(0xFFFEF6FF),
                        child: Center(
                          child:
                              _pickedFile.path.isNotEmpty
                                  ? ClipOval(
                                      child: kIsWeb
                                          ? Image.network(
                                              _pickedFile.path,
                                              width: 58,
                                              height: 58,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              _pickedFile,
                                              width: 58,
                                              height: 58,
                                              fit: BoxFit.cover,
                                            ),
                                    )
                                  : Image.asset(
                                      'images/plus_icon.png',
                                      width: 20,
                                      height: 20,
                                    ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Username,
                          style: const TextStyle(
                            color: Color(0xFFFEF6FF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          email,
                          style: const TextStyle(
                            color: Color(0xFFA8A8A8),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 260,
                width: 1 * MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomElement('images/profile.png', 'My Account',
                        'Make changes to your account'),
                    _buildBottomElement(
                        'images/email.png', 'Change Email Address', email),
                    _buildBottomElement('images/lock.png', 'Change Password',
                        'Change your password'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'More',
                style: TextStyle(
                  color: Color(0xFF717171),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 140,
                width: 1 * MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomElement('images/stats.png', 'Your Stats', ''),
                    _buildBottomElement('images/out.png', 'Log out', ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5D4FF), width: 1.0),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFFFEF6FF),
            selectedItemColor: const Color(0xFF7B31F4),
            unselectedItemColor: const Color(0xFF7B31F4).withOpacity(0.52),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                
                _currentIndex = index;
                Navigator.of(context).push(
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
    );
  }

  Widget _buildBottomElement(String imageName, String name, String subtitle) {
    return GestureDetector(
      onTap: () {
        if (name == 'My Account' ||
            name == 'Change Email Address' ||
            name == 'Change Password') {
          showChangeInfoDialog(name);
        } else if (name == 'Log out') {
          updateLastRowKeepMeSignedInToFalse();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ),
          );
        } else if (name == 'Your Stats') {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  Stats(url: _pickedFile.path, name: Username),
            ),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF0E5FB),
                ),
                child: Center(
                  child: Image.asset(
                    imageName,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: subtitle.isEmpty ? 10 : 2,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xFF1F1926),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFFA8A8A8),
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            'images/arrow.png',
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedFile = File(pickedFile.path);
      });

    }
  }

  Future<void> updateLastRowKeepMeSignedInToFalse() async {
      var box = await Hive.openBox('testBox');
      if (box.isNotEmpty) {
        MyData lastData = box.getAt(box.length - 1) as MyData;
        lastData.keepMeSignedIn = false;
        box.putAt(box.length - 1, lastData);
      }
    
  }

  void showChangeInfoDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangeInfoPopup(
          name: name,
          email: email,
          onUpdateName: updateName,
          onUpdateEmail: updateEmail,
          screenWidth: MediaQuery.of(context).size.width,
          screenHeight: MediaQuery.of(context).size.height,
        );
      },
    );
  }

  Future<void> updateName(String newName) async {
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Updating Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Please wait...'),
            ],
          ),
        );
      },
    );

    try {
      if (user != null) {
        
        await user?.updateDisplayName(newName);
        setState(() {
          Username = newName;
        });
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Name Updated'),
              content: Text('Display Name updated to: $newName'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('An error occurred while updating the name.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void updateEmail(String newEmail) {
    setState(() {
      email = newEmail;
    });
  }
}
