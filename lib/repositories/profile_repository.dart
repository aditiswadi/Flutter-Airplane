import 'package:airplane_bloc/constants/db_constants.dart';
import 'package:airplane_bloc/models/custom_error.dart';
import 'package:airplane_bloc/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;
  ProfileRepository({
    required this.firebaseFirestore,
  });

  Future<UserModel> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot userDoc = await userRef.doc(uid).get();

      if (userDoc.exists) {
        final currentUser = UserModel.fromDoc(userDoc);
        return currentUser;
      }

      throw 'User not found';
    } on FirebaseException catch (e) {
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
}
