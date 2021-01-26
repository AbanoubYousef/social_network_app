
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'CreateAccountMobx.g.dart';

class CreateAccountcontroller = CreateAccountMobx with _$CreateAccountcontroller;

abstract class CreateAccountMobx with Store {
  @observable
  String username;
  @action
  submit(BuildContext context){
   // formKey.currentState.save();
    Navigator.pop(context,username);
  }

}