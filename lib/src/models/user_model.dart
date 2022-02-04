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
}
