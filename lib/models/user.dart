import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String userId;
  final String displayName;
  final String bio;
  final String photoUrl;
  final String email;
  User({this.email,this.userId,this.photoUrl,this.bio,this.displayName});

  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      userId: doc['id'],
      bio: doc['bio'],
        displayName: doc['displayName'],
      email: doc['email'],
      photoUrl: doc['photoUrl']
    );
  }
}