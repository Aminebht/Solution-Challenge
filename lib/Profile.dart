import 'dart:io' if (dart.library.html) 'dart:html' as html;
import 'dart:io';
import 'package:app_0/SignIn.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ImagePicker _imagePicker;
  late File _pickedFile;
  String name='Ayoub mkadmi';
  String email='mkadmi@gmail.com';


  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _pickedFile = File('');
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
                padding: EdgeInsets.only(left:40,top:15,bottom:15,right: 40),
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
                          child: _pickedFile != null && _pickedFile.path.isNotEmpty
                              ? ClipOval(
                                  child: kIsWeb
                                      ? Image.network(
                                          _pickedFile.path,
                                          width: 58, // Adjust the size as needed
                                          height: 58, // Adjust the size as needed
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          _pickedFile,
                                          width: 58, // Adjust the size as needed
                                          height: 58, // Adjust the size as needed
                                          fit: BoxFit.cover,
                                        ),
                                )
                              : Image.asset(
                                  'images/plus_icon.png',
                                  width: 20, // Adjust the size as needed
                                  height: 20, // Adjust the size as needed
                                ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$name',
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
              // New Container with 4 elements at the bottom
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
                    _buildBottomElement('images/profile.png', 'My Account', 'Make changes to your account'),
                    _buildBottomElement('images/email.png', 'Change Email Address', '$email'),
                    _buildBottomElement('images/lock.png', 'Change Password ', 'Change your password'),
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
                padding: EdgeInsets.only(left:30,right: 30,top: 20,bottom: 20),
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
    );
  }

 Widget _buildBottomElement(String imageName, String name, String subtitle) {
  return GestureDetector(
    onTap: () {
      // Add the desired action when the element is clicked
      if (name == 'My Account') {
        /*Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyAccount()));*/
      } else if (name == 'Change Email Address') {
        /*Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyEmail()));*/
      } else if (name == 'Change Password') {
        /*Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyPassword()));*/
      } else if (name == 'Log out') {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
      }
      else if (name == 'Your Stats') {
        /*Navigator.push(context, MaterialPageRoute(builder: (context) => UserStats()));*/
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
            'images/arrow.png', // Replace with the actual arrow image
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
}
