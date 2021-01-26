import 'package:bobshare/widgets/header.dart';
import 'package:bobshare/widgets/post.dart';
import 'package:bobshare/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
class PostScreen extends StatefulWidget {
  final String userId;
  final String postId;
  PostScreen({this.userId, this.postId});
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  Future<DocumentSnapshot> _getUserData(userId,postId) async {
    return  postsRef
        .document(userId)
        .collection('userPosts')
        .document(postId)
        .get();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserData(widget.userId,widget.postId);
//    _auth.onAuthStateChanged
//        .firstWhere((user) => user != null)
//        .then((user) {
//      _uid = user.uid;
//      print (_uid);
//    });
    postsRef
        .document(widget.userId)
        .collection('userPosts')
        .document(widget.postId)
        .get().then((post){

          print (post.documentID);
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData(widget.userId,widget.postId),
      builder: (BuildContext context, AsyncSnapshot snapshot)  {
        if (!snapshot.hasData) {
          return circularProgress(context);
        }
        Post post = Post.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(
            appBar: header(context, title: post.description),
            body: ListView(
              children: <Widget>[
                Container(
                  child: post,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

