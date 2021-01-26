// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Searchcontroller on SearchMobx, Store {
  Computed<Future<QuerySnapshot>> _$searchResultFutureComputed;

  @override
  Future<QuerySnapshot> get searchResultFuture =>
      (_$searchResultFutureComputed ??=
              Computed<Future<QuerySnapshot>>(() => super.searchResultFuture))
          .value;

  final _$usersAtom = Atom(name: 'SearchMobx.users');

  @override
  Future<QuerySnapshot> get users {
    _$usersAtom.context.enforceReadPolicy(_$usersAtom);
    _$usersAtom.reportObserved();
    return super.users;
  }

  @override
  set users(Future<QuerySnapshot> value) {
    _$usersAtom.context.conditionallyRunInAction(() {
      super.users = value;
      _$usersAtom.reportChanged();
    }, _$usersAtom, name: '${_$usersAtom.name}_set');
  }

  final _$SearchMobxActionController = ActionController(name: 'SearchMobx');

  @override
  dynamic handleSearch(String query) {
    final _$actionInfo = _$SearchMobxActionController.startAction();
    try {
      return super.handleSearch(query);
    } finally {
      _$SearchMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'users: ${users.toString()},searchResultFuture: ${searchResultFuture.toString()}';
    return '{$string}';
  }
}
