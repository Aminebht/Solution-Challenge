import 'dart:io' if (dart.library.html) 'dart:html' as html;
import 'dart:io';
import 'package:app_0/Home1.dart';
import 'package:app_0/SignIn.dart';
import 'package:app_0/Stats.dart';
import 'package:app_0/my_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class ChangeInfoPopup extends StatefulWidget {
  final String name;
  final String email;
  final Function(String) onUpdateName;
  final Function(String) onUpdateEmail;
  final double screenWidth;
  final double screenHeight;

  ChangeInfoPopup({
    Key? key,
    required this.name,
    required this.email,
    required this.onUpdateName,
    required this.onUpdateEmail,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  _ChangeInfoPopupState createState() =>
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

    return Container(
      width: dialogWidth,
      height: dialogHeight,
      child: AlertDialog(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(widget.name),
        content: Padding(
          padding: EdgeInsets.all(30), // Add padding here
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
                        decoration: InputDecoration(labelText: 'New Name'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: newNumberController,
                        decoration:
                            InputDecoration(labelText: 'New Phone Number'),
                      ),
                    ],
                  ),
                if (widget.name == 'Change Email Address')
                  TextField(
                    controller: newEmailController,
                    decoration: InputDecoration(labelText: 'New Email'),
                  ),
                if (widget.name == 'Change Password')
                  Column(
                    children: [
                      TextField(
                        controller: newPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'New Password'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: checkpasswordController,
                        obscureText: true,
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                      ),
                    ],
                  ),
                if (widget.name == 'Log out')
                  ElevatedButton(
                    onPressed: () {
                      // Perform log out logic here
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        // Navigate to SignIn and remove all previous routes
                        MaterialPageRoute(
                          builder: (context) =>
                              SignIn(), // Replace SignIn with the actual widget/class for your sign-in screen
                        ),
                      );
                    },
                    child: Text('Log out'),
                  ),
                if (widget.name == 'Your Stats')
                  ElevatedButton(
                    onPressed: () {
                      // Perform your stats logic here
                      /* Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Stats(url:_pickedFile.path,name:name),
                        ),
                      );*/
                    },
                    child: Text('Your Stats'),
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

                    if (widget.name == 'My Account' &&
                        widget.onUpdateName != null) {
                      widget.onUpdateName(newName);
                    } else if (widget.name == 'Change Email Address' &&
                        widget.onUpdateEmail != null) {
                      widget.onUpdateEmail(newEmail);
                    }
                    if (widget.name == 'Change Password') {
                      if (newPassword != checkPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Passwords do not match.'),
                            backgroundColor: Color(0xFF572CB2),
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
                        MaterialStateProperty.all<Color>(Color(0xFF572CB2)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(150, 48)),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 16),
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
                        MaterialStateProperty.all<Color>(Color(0xFF572CB2)),
                  ),
                  child: Text(
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

  List<Widget> pages = [Home1(), Profile(), Profile()];
  late ImagePicker _imagePicker;
  late File _pickedFile;
  User? user = FirebaseAuth.instance.currentUser;
  String Username = 'No Display Name';
  String email = 'mkadmi@gmail.com';
  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _pickedFile = File('');
    if (user != null) {
      Username = user?.displayName ?? 'No Display Name';
      print('Display Name: $Username');
    } else {
      print('User not signed in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 1 * MediaQuery.of(context).size.width,
                height: 93,
                padding:
                    EdgeInsets.only(left: 40, top: 15, bottom: 15, right: 40),
                decoration: BoxDecoration(
                  color: Color(0xFF572CB2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _getImage,
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white,
                        child: Center(
                          child:
                              _pickedFile != null && _pickedFile.path.isNotEmpty
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
                          '$Username',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '$email',
                          style: TextStyle(
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
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 260,
                width: 1 * MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomElement('images/profile.png', 'My Account',
                        'Make changes to your account'),
                    _buildBottomElement(
                        'images/email.png', 'Change Email Address', '$email'),
                    _buildBottomElement('images/lock.png', 'Change Password',
                        'Change your password'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'More',
                style: TextStyle(
                  color: Color(0xFF717171),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 140,
                width: 1 * MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
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

  Widget _buildBottomElement(String imageName, String name, String subtitle) {
    return GestureDetector(
      onTap: () {
        if (name == 'My Account' ||
            name == 'Change Email Address' ||
            name == 'Change Password') {
          showChangeInfoDialog(name);
        } else if (name == 'Log out') {
          // Perform log out logic and navigate to SignIn
          updateLastRowKeepMeSignedInToFalse();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ),
          );
        } else if (name == 'Your Stats') {
          // Perform your stats logic here
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  Stats(url: _pickedFile.path, name: Username),
            ),
          );
        }
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
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
                SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: subtitle.isEmpty ? 10 : 2,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
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
      ),
    );
  }

  Future<void> _getImage() async {
    final pickedFile = kIsWeb
        ? await _imagePicker.pickImage(source: ImageSource.gallery)
        : await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedFile = File(pickedFile.path);
      });
    }
  }

  Future<void> updateLastRowKeepMeSignedInToFalse() async {
    try {
      var box = await Hive.openBox('testBox');

      // Check if the box is not empty
      if (box.isNotEmpty) {
        // Get the last added item
        MyData lastData = box.getAt(box.length - 1) as MyData;

        // Update the keepMeSignedIn property to false
        lastData.keepMeSignedIn = false;

        // Put the updated data back into the box
        box.putAt(box.length - 1, lastData);
      }
    } catch (e) {
      print("Exception during updating last row: $e");
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
    try {
      if (user != null) {
        await user?.updateDisplayName(newName);
        setState(() {
          Username = newName;
        });

        // Display a dialog to inform the user about the name update
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Name Updated'),
              content: Text('Display Name updated to: $newName'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );

        print('Display Name updated to: $newName');
      }
    } catch (e) {
      print('Error updating display name: $e');
      // Handle error accordingly
    }
  }

  void updateEmail(String newEmail) {
    setState(() {
      email = newEmail;
    });
  }
}
