// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomePageMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePagecontroller on HomePageMobx, Store {
  final _$timeStampAtom = Atom(name: 'HomePageMobx.timeStamp');

  @override
  DateTime get timeStamp {
    _$timeStampAtom.context.enforceReadPolicy(_$timeStampAtom);
    _$timeStampAtom.reportObserved();
    return super.timeStamp;
  }

  @override
  set timeStamp(DateTime value) {
    _$timeStampAtom.context.conditionallyRunInAction(() {
      super.timeStamp = value;
      _$timeStampAtom.reportChanged();
    }, _$timeStampAtom, name: '${_$timeStampAtom.name}_set');
  }

  final _$currentUserAtom = Atom(name: 'HomePageMobx.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$pageIndexAtom = Atom(name: 'HomePageMobx.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.context.enforceReadPolicy(_$pageIndexAtom);
    _$pageIndexAtom.reportObserved();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.context.conditionallyRunInAction(() {
      super.pageIndex = value;
      _$pageIndexAtom.reportChanged();
    }, _$pageIndexAtom, name: '${_$pageIndexAtom.name}_set');
  }

  final _$isAuthAtom = Atom(name: 'HomePageMobx.isAuth');

  @override
  bool get isAuth {
    _$isAuthAtom.context.enforceReadPolicy(_$isAuthAtom);
    _$isAuthAtom.reportObserved();
    return super.isAuth;
  }

  @override
  set isAuth(bool value) {
    _$isAuthAtom.context.conditionallyRunInAction(() {
      super.isAuth = value;
      _$isAuthAtom.reportChanged();
    }, _$isAuthAtom, name: '${_$isAuthAtom.name}_set');
  }

  final _$createUserInFirestoreAsyncAction =
      AsyncAction('createUserInFirestore');

  @override
  Future createUserInFirestore() {
    return _$createUserInFirestoreAsyncAction
        .run(() => super.createUserInFirestore());
  }

  final _$HomePageMobxActionController = ActionController(name: 'HomePageMobx');

  @override
  void logout() {
    final _$actionInfo = _$HomePageMobxActionController.startAction();
    try {
      return super.logout();
    } finally {
      _$HomePageMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageChanged(int index) {
    final _$actionInfo = _$HomePageMobxActionController.startAction();
    try {
      return super.onPageChanged(index);
    } finally {
      _$HomePageMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic login() {
    final _$actionInfo = _$HomePageMobxActionController.startAction();
    try {
      return super.login();
    } finally {
      _$HomePageMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'timeStamp: ${timeStamp.toString()},currentUser: ${currentUser.toString()},pageIndex: ${pageIndex.toString()},isAuth: ${isAuth.toString()}';
    return '{$string}';
  }
}
