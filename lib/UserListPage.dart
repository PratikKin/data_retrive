import 'package:flutter/material.dart';

import 'EditUserPage.dart';
import 'User.dart';
import 'UserService.dart';

class UserListPage extends StatelessWidget {
  final UserService userService;

  UserListPage({required this.userService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        elevation: 0.0,
      ),
      body: StreamBuilder<List<User>>(
        stream: userService.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User>? users = snapshot.data;
            return ListView.builder(
              itemCount: users?.length ?? 0,
              itemBuilder: (context, index) {
                final user = users?[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.white10),
                        color: Colors.white10),
                    child: ListTile(
                      title: Text(user?.name ?? 'N/A'),
                      subtitle: Text(user?.number ?? 'N/A'),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          if (user != null) {
                            // Check if user is not null
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditUserPage(
                                    userService: userService, user: user),
                              ),
                            );
                          } else {
                            print("Error occured while retriving the data");
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
