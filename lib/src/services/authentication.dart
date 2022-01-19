import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/src/services/storage.dart';

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

        //* Add User Data to Firestore
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'username': username,
          'uid': credential.user!.uid,
          'bio': bio,
          // 'image': imageFile,
          'followers': [],
          'following': [],
          'profileUrl': profileUrl,
        });

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
