import 'package:chat_app/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class APIs {
  //firebase auth instance
  static FirebaseAuth auth = FirebaseAuth.instance;
  //cloud firestore instane
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  //checks if user exists or not
  static User get authId => auth.currentUser!;
  static Future<bool> userExists() async {
    return (await firestore
            .collection('users') //check in firestore collections
            .doc(authId
                .uid) //whether login uid is registered in cloud firestore id
            .get())
        .exists;
  }

  //creates a new user
  static Future<void> createUser() async {
    final String time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatuser = chatUser(
        image: authId.photoURL.toString(),
        about: "hey chatster",
        name: authId.displayName.toString(),
        createdAt: time,
        isOnline: false,
        ID: authId.uid,
        lastOnline: time,
        pushToken: "",
        email: authId.email.toString());
    return await firestore
        .collection('users')
        .doc(authId.uid)
        .set(chatuser.toJson());
  }
}
