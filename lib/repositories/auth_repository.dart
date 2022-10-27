import 'package:airplane_bloc/constants/db_constants.dart';
import 'package:airplane_bloc/models/custom_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final fbAuth.FirebaseAuth firebaseAuth;
  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Stream<fbAuth.User?> get user => firebaseAuth.userChanges();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on fbAuth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final fbAuth.UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final signedInUser = userCredential.user!;

      await userRef.doc(signedInUser.uid).set({
        'name': name,
        'email': email,
        'profileImage': 'https://picsum.photos/300',
        'hobby': '',
        'balance': 100000000,
      });
    } on fbAuth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
