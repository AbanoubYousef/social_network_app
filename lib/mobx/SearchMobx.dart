import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'SearchMobx.g.dart';

//  flutter packages pub run build_runner watch --delete-conflicting-outputs

class Searchcontroller = SearchMobx with _$Searchcontroller;

abstract class SearchMobx with Store {
  final usersRef = Firestore.instance.collection('users');
  @observable
  Future<QuerySnapshot> users;
  @computed
   Future<QuerySnapshot> get searchResultFuture => users;

  @action
  handleSearch(String query) {
     users= usersRef
        .where("displayName", isEqualTo: query)
        .getDocuments();
  }
}
