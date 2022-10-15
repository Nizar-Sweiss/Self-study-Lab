import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final auth = FirebaseAuth.instance;
final CollectionReference notes = FirebaseFirestore.instance.collection(
  'notes-${FirebaseAuth.instance.currentUser!.uid}',
);
