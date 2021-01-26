// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateAccountMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountcontroller on CreateAccountMobx, Store {
  final _$usernameAtom = Atom(name: 'CreateAccountMobx.username');

  @override
  String get username {
    _$usernameAtom.context.enforceReadPolicy(_$usernameAtom);
    _$usernameAtom.reportObserved();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.context.conditionallyRunInAction(() {
      super.username = value;
      _$usernameAtom.reportChanged();
    }, _$usernameAtom, name: '${_$usernameAtom.name}_set');
  }

  final _$CreateAccountMobxActionController =
      ActionController(name: 'CreateAccountMobx');

  @override
  dynamic submit(BuildContext context) {
    final _$actionInfo = _$CreateAccountMobxActionController.startAction();
    try {
      return super.submit(context);
    } finally {
      _$CreateAccountMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'username: ${username.toString()}';
    return '{$string}';
  }
}
