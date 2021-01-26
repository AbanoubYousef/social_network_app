import 'dart:io';
import 'package:mobx/mobx.dart';
part 'UploadMobx.g.dart';

//  flutter packages pub run build_runner watch --delete-conflicting-outputs

class Uploadcontroller = UploadMobx with _$Uploadcontroller;

abstract class UploadMobx with Store {
  @observable
  File photocamera;
  @observable
  File photogallary;

}