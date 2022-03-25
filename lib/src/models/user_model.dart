import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String bio;
  final String profileUrl;
  final List following;
  final List followers;

  User({
    required this.username,
    required this.uid,
    required this.bio,
    required this.profileUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'bio': bio,
        'profileUrl': profileUrl,
        'followers': followers,
        'following': following,
      };

  static User fromSnapshot(DocumentSnapshot snap) {
    final snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot['uid'],
      username: snapshot['username'],
      profileUrl: snapshot['profileUrl'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
