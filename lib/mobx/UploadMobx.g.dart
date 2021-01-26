// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UploadMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Uploadcontroller on UploadMobx, Store {
  final _$photocameraAtom = Atom(name: 'UploadMobx.photocamera');

  @override
  File get photocamera {
    _$photocameraAtom.context.enforceReadPolicy(_$photocameraAtom);
    _$photocameraAtom.reportObserved();
    return super.photocamera;
  }

  @override
  set photocamera(File value) {
    _$photocameraAtom.context.conditionallyRunInAction(() {
      super.photocamera = value;
      _$photocameraAtom.reportChanged();
    }, _$photocameraAtom, name: '${_$photocameraAtom.name}_set');
  }

  final _$photogallaryAtom = Atom(name: 'UploadMobx.photogallary');

  @override
  File get photogallary {
    _$photogallaryAtom.context.enforceReadPolicy(_$photogallaryAtom);
    _$photogallaryAtom.reportObserved();
    return super.photogallary;
  }

  @override
  set photogallary(File value) {
    _$photogallaryAtom.context.conditionallyRunInAction(() {
      super.photogallary = value;
      _$photogallaryAtom.reportChanged();
    }, _$photogallaryAtom, name: '${_$photogallaryAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'photocamera: ${photocamera.toString()},photogallary: ${photogallary.toString()}';
    return '{$string}';
  }
}
