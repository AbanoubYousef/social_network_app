import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'TimeLineMobx.g.dart';

//  flutter packages pub run build_runner watch --delete-conflicting-outputs

class TimeLinecontroller = TimeLineMobx with _$TimeLinecontroller;

abstract class TimeLineMobx with Store {
  final usersRef = Firestore.instance.collection('users');

//  @action
//  updateuser() async{
//    final doc = await usersRef.document('newusercreated').get();
//    if(doc.exists){
//      doc.reference.updateData({"username":"popyou"});
//    }
//  }
//  @action
//  deleteuser()async{
//    final doc = await usersRef.document('newusercreated').get();
//    if(doc.exists){
//      doc.reference.delete();
//    }
//  }

//    @action
//  createUser(){
//      usersRef.document('newusercreated').setData({
//        "username":"wadee",
//        "isadmin":true,
//        "countpost":23
//      });
//    }
//    @action
//    adduser(){
//      usersRef.add({
//        "username":"yousef",
//        "isadmin":true,
//        "countpost":0
//      });
//    }
//  @action
//  getUsers() async {
//    QuerySnapshot snapshot = await users
//        .where("isadmin", isEqualTo: true)
//        .where("countpost", isLessThan: 5)
//        .getDocuments();
//    snapshot.documents.forEach((DocumentSnapshot doc) {
//      print(doc.data);
//    });
//  }
//
//  @action
//  getUserById() async {
//    String id = "cZrAxAIpGOJq8PjupUK7";
//    DocumentSnapshot doc = await users.document(id).get();
//    print(doc.data);
//  }
}
