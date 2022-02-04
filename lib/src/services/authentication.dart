import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/storage.dart';
import '../models/user_model.dart' as userModel;

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List imageFile,
  }) async {
    String res = 'Some unexpected Error Occurred';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          imageFile != null) {
        //* Register User

        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(credential.user!.uid);

        final profileUrl = await StorageServices()
            .uploadFileToStorage('profilePics', imageFile, false);

        userModel.User user = userModel.User(
          username: username,
          uid: credential.user!.uid,
          bio: bio,
          profileUrl: profileUrl,
          followers: [],
          following: [],
        );

        //* Add User Data to Firestore
        await _firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());

        res = 'Success';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //* Login

  Future<String> logIn(
      {required String email, required String password}) async {
    String res = 'Some unexpected Error Occurred';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "Success";
      } else {
        res = "Please Enter all the Fields";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
