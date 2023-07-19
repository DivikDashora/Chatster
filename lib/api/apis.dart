import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class APIs {
  //firebase auth instance
  static FirebaseAuth auth = FirebaseAuth.instance;
  //cloud firestore instane
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}
