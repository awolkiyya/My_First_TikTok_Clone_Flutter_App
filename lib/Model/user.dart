import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profile;
  String email;
  String uid;
  User(
      {required this.name,
      required this.profile,
      required this.email,
      required this.uid});
  Map<String, dynamic> toJson() => {
        'name': name,
        'profile': profile,
        'email': email,
        'uid': uid,
      };
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        name: snapshot['name'],
        profile: snapshot['profile'],
        email: snapshot['email'],
        uid: snapshot['uid']);
  }
}
