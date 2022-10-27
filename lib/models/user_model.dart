import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String hobby;
  final int balance;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.hobby,
    required this.balance,
  });

  factory UserModel.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return UserModel(
      id: userDoc.id,
      name: userData!['name'],
      email: userData['email'],
      hobby: userData['hobby'],
      balance: userData['balance'],
    );
  }

  factory UserModel.initialUser() {
    return UserModel(
      id: '',
      name: '',
      email: '',
      hobby: '',
      balance: 0,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        email,
        hobby,
        balance,
      ];

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, hobby: $hobby, balance: $balance)';
  }
}
