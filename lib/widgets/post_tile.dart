import 'package:bobshare/pages/post_screen.dart';
import 'package:bobshare/widgets/custom_image.dart';
import 'package:bobshare/widgets/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post post;

  PostTile(this.post);

  showPost(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostScreen(
          userId: post.ownerId,
          postId:post.postId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
    onTap: () => showPost(context),
    child: cachedNetworkImage(mediaUrl: post.mediaUrl),
      );
  }
}
