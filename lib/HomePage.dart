import 'dart:ui';

import 'package:flutter/material.dart';

import 'User.dart';
import 'UserListPage.dart';
import 'UserService.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserService _userService = UserService();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  bool isEditing = false;
  String editingUserId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Input fields for user data
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white10),
              ),
              child: ClipRRect(
                // ClipRRect is used to apply border radius to the background
                borderRadius: BorderRadius.circular(20.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10), // Adjust the blur values as needed
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    color: Colors.white.withOpacity(0.2),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white10),
                color: Colors
                    .transparent, // Set the container's color to transparent
              ),
              child: ClipRRect(
                // ClipRRect is used to apply border radius to the background
                borderRadius: BorderRadius.circular(20.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10), // Adjust the blur values as needed
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    color: Colors.white.withOpacity(
                        0.2), // Adjust the opacity to control the frosted effect
                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        labelText: 'Number',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white12)),
                  onPressed: () async {
                    if (isEditing) {
                      await _userService.updateUser(User(
                        id: editingUserId,
                        name: nameController.text,
                        number: numberController.text,
                      ));
                    } else {
                      User user = User(
                        name: nameController.text,
                        number: numberController.text,
                        id: '',
                      );

                      await _userService.addUser(user);
                    }

                    _clearTextFields();
                  },
                  child: Text(isEditing ? 'Update' : 'Add'),
                ),

                // Show button
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white12)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserListPage(userService: _userService),
                      ),
                    );
                  },
                  child: Text('Show'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _clearTextFields() {
    nameController.clear();
    numberController.clear();
    isEditing = false;
    editingUserId = '';
  }
}
