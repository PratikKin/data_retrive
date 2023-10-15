import 'package:cloud_firestore/cloud_firestore.dart';

import 'User.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    try {
      await _firestore.collection('users').add({
        'name': user.name,
        'number': user.number,
      });
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  Future<List<User>> getUsers() async {
    try {
      final querySnapshot = await _firestore.collection('users').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return User(
          id: doc.id,
          name: data['name'],
          number: data['number'],
        );
      }).toList();
    } catch (e) {
      print("Error getting users: $e");
      return [];
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await _firestore.collection('users').doc(user.id).update({
        'name': user.name,
        'number': user.number,
      });
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  Stream<List<User>> getUsersStream() {
    return _firestore.collection('users').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return User(
            id: doc.id,
            name: data['name'] ?? '', // Provide a default value for 'name'
            number:
                data['number'] ?? '', // Provide a default value for 'number'
          );
        }).toList();
      },
    );
  }
}
