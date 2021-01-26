import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar header(context,{String title,bool isAppBarTitle = false}){
  return AppBar(
    title: Text(
      isAppBarTitle?"BobShare":title,
      style: TextStyle(
        fontSize:isAppBarTitle? 50.0:40.0,
        fontFamily: 'signatra',
        color: Colors.tealAccent,
      ),
       overflow: TextOverflow.ellipsis,
     ),
    centerTitle: true,
//    backgroundColor: Theme.of(context).accentColor,
  );
}