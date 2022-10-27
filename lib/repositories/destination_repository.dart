import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:airplane_bloc/constants/db_constants.dart';
import 'package:airplane_bloc/models/custom_error.dart';
import 'package:airplane_bloc/models/destination_model.dart';

class DestinationRepository {
  Future<List<DestinationModel>> fetchDestination() async {
    try {
      QuerySnapshot result = await destinationRef.get();
      List<DestinationModel> destinations = result.docs.map(
        (e) {
          return DestinationModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return destinations;
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
