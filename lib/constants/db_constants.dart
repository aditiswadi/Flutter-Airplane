import 'package:cloud_firestore/cloud_firestore.dart';

final userRef = FirebaseFirestore.instance.collection('users');
final destinationRef = FirebaseFirestore.instance.collection('destinations');
final transactionRef = FirebaseFirestore.instance.collection('transactions');
