import 'package:bobshare/widgets/progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImage({String mediaUrl,double width}) {
  return CachedNetworkImage(
    height: 300,
    width: width,
    imageUrl: mediaUrl,
    fit: BoxFit.cover,
    placeholder: (context, url) => circularProgress(context),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
