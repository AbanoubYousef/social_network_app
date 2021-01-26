
import 'package:bobshare/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'HomePageMobx.g.dart';

class HomePagecontroller = HomePageMobx with _$HomePagecontroller;

abstract class HomePageMobx with Store {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final StorageReference storageRef = FirebaseStorage.instance.ref();
  final postsRef = Firestore.instance.collection('posts');
  final DateTime timestamp = DateTime.now();
  final usersRef = Firestore.instance.collection('users');
  final GoogleSignIn googleSingIn =GoogleSignIn();
  @observable
  DateTime timeStamp =DateTime.now();
  @observable
  User currentUser;
  @observable
  int pageIndex=0;
  @observable
  bool isAuth =false;
  @action
  void logout(){
    googleSingIn.signOut();
  }

  @action
  void onPageChanged(int index){
    pageIndex=index;
  }

  @action
  createUserInFirestore() async{
    GoogleSignInAccount user = googleSingIn.currentUser;
    DocumentSnapshot doc = await usersRef.document(user.id).get();
    if(!doc.exists){
     usersRef.document(user.id).setData({
       "id":user.id,
       "displayName":user.displayName,
       "photoUrl":user.photoUrl,
       "email":user.email,
       "bio":"",
       "timeStamp":timeStamp,
     });
     doc = await usersRef.document(user.id).get();
    }
   currentUser=User.fromDocument(doc);
//    print(currentUser);
//    print(currentUser.userId);
  }
  @action
  login() {
    googleSingIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
       if(account !=null){
         createUserInFirestore();
         isAuth  =true;
       }else{
         print("errro ");
         isAuth=false;
       }
    });
    googleSingIn.signIn();
  }
}