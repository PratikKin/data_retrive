import 'dart:ui';

import 'package:flutter/material.dart';

import 'User.dart';
import 'UserService.dart';

class EditUserPage extends StatefulWidget {
  final UserService userService;
  final User user;

  EditUserPage({required this.userService, required this.user});

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    numberController.text = widget.user.number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Input fields for editing user data
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white10),
              ),
              child: ClipRRect(
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
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10), // Adjust the blur values as needed
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    color: Colors.white.withOpacity(0.2),
                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        labelText: 'Number',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // Update button
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white12)),
              onPressed: () async {
                await widget.userService.updateUser(User(
                  id: widget.user.id,
                  name: nameController.text,
                  number: numberController.text,
                ));
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
