//import 'package:bobshare/mobx/CreateAccountMobx.dart';
//import 'package:bobshare/widgets/header.dart';
//import 'package:flutter/material.dart';
//
//class CreateAccount extends StatefulWidget {
//  @override
//  _CreateAccountState createState() => _CreateAccountState();
//}
//
//class _CreateAccountState extends State<CreateAccount> {
//
//
// CreateAccountcontroller con =CreateAccountcontroller();
//
// final formKey =GlobalKey<FormState>();
//
// @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: header(context, title: 'set up your profile'),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.all(15),
//              child: Center(
//                child: Text(
//                  "Create a username",
//                  style: TextStyle(fontSize: 25.0),
//                ),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.all(15),
//              child: Center(
//                child: Form(
//                  child: TextFormField(
//                    onSaved: (val)=>con.username=val,
//                    key: formKey,
//                    decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                       hintText: "must be at least 3 char",
//                      labelText: "username",
//                      labelStyle: TextStyle(fontSize: 15.0),
//                    ),
//                  ),
//              ),
//            ),
//            ),
//            GestureDetector(
//              onTap: con.submit(context),
//               child: Container(
//                 height: 50.0,
//                 width: MediaQuery.of(context).size.width*.75,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Text("Submit",style: TextStyle(
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.bold,
//                   color:Colors.tealAccent
//                 ),),
//               ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
