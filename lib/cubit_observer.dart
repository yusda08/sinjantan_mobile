import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CubitObserver extends BlocObserver {


  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('CubitObserver ${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
}
