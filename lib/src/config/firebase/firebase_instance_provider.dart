import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_instance_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFireStoreInstance(FirebaseFireStoreInstanceRef ref) {
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}
